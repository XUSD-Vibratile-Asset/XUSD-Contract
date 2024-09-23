// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import './VibeRegistry.sol';
import './IVibePass.sol';
import './Classes/VibeBase.sol';
import './AddressReg.sol';
import './AccessorMod.sol';

/**
 * @title MyGovernor
 * @dev A contract to manage proposal creation, voting, and checking votes for Vibe-based governance. 
 * It integrates with the VibeRegistry and VibePass contracts for access control and voting.
 */
contract MyGovernor is AccesorMod {

    using LibRegistryAdd for LibRegistryAdd.Registry;
    using Address for address;
     using AuthLib for AuthLib.RoleData;
    // Custom errors for specific conditions
    error AlreadyProposed(address classAddress);
    error NotAllowedAccess();
    error AlreadyPassed(address classAddress);
    error AlreadyVoted(address voter, address classAddress);
    error NeedAVibePass();
    error InvalidDenominator(uint min, uint max);
    error ClassAddressNotMatch(address provided, address expected);
    error NotAContract(address provided);
    // Events
    event VoteProposed(
        address indexed proposer,
        address indexed classAddress,
        string name,
        string description,
        uint classType,
        bool process,
        bool rewards
    );
    event VoteCast(
        address indexed voter,
        address indexed classAddress,
        uint voteTotal
    );
    event VoteChecked(
        address indexed classAddress,
        bool approved,
        uint totalVotes
    );
    event VoteDenominatorUpdated(uint oldDenominator, uint newDenominator);
    event ProposalFailed(
        address indexed proposer,
        address indexed classAddress,
        string reason
    );
    event NftAddressUpdated(address oldNft, address newNft);

    // Data structures for proposal and vote tallying
    struct VoteProposal {
        address classAddress;
        string description;
        string name;
        bool process;
        bool rewards;
        uint classType;
    }

    struct VoteTally {
        address classAddress;
        uint voteTotal;
        uint index;
        uint[] hashes;
        uint timestampStart;
        uint totalNft;
        string name;
        string description;
        bool approved;
        bool rewards;
        bool process;
        uint classType;
    }

    // State variables
    uint public denominator = 2;

    LibRegistryAdd.Registry internal VoterTallyRegistry;
    mapping(uint => mapping(address => bool)) private voterRegistryMap;
    mapping(address => VoteTally) public VoterTallyMap;

    IVibePass private vibePass;
    VibeRegistry private classReg;

    /**
     * @dev Initializes the MyGovernor contract with the specified parameters.
     * @param _access Address of the access control contract.
     * @param Nft Address of the VibePass contract.
     * @param _classReg Address of the VibeRegistry contract.
     */
    constructor(address _access, address Nft, address _classReg) AccesorMod(_access) {
        vibePass = IVibePass(Nft);
        classReg = VibeRegistry(_classReg);
    }

    /**
     * @notice Update the denominator for vote approval threshold.
     * @param _denominator New denominator for vote tally checks.
     * @dev The new denominator must be between 1 and 10.
     * Only callable by a Senator.
     */
    function updateVoteDen(uint _denominator) external onlySenator {
        if (_denominator < 1 || _denominator > 10) {
            revert InvalidDenominator(1, 10);
        }
        emit VoteDenominatorUpdated(denominator, _denominator);
        denominator = _denominator;
    }

    /**
     * @notice Update the VibePass contract address.
     * @param _Nft The new address for the VibePass contract.
     * @dev Only callable by a Senator.
     */
    function updateNft(address _Nft) external onlySenator {
        emit NftAddressUpdated(address(vibePass), _Nft);
        vibePass = IVibePass(_Nft);
    }

    /**
     * @notice Get the number of proposals currently in the registry.
     * @return The count of proposals.
     */
    function viewNumberOfProposals() external view returns (uint) {
        return VoterTallyRegistry.Count();
    }

    /**
     * @notice Retrieve a list of unapproved proposals.
     * @param limit The number of proposals to return.
     * @param offset The starting index for pagination.
     * @return An array of VoteTally structs representing unapproved proposals.
     */
    function showAllProposals(uint limit, uint offset) external view returns (VoteTally[] memory) {
        uint tallyCount = VoterTallyRegistry.Count();
        uint activeCount;

        for (uint i = offset; i < tallyCount && activeCount < limit; ) {
            if (!VoterTallyMap[VoterTallyRegistry.GetHashByIndex(i)].approved) {
                activeCount++;
            }
            unchecked {
                i++;
            }
        }

        VoteTally[] memory voters = new VoteTally[](activeCount);
        uint index = 0;

        for (uint i = offset; i < tallyCount && index < limit; ) {
            if (!VoterTallyMap[VoterTallyRegistry.GetHashByIndex(i)].approved) {
                voters[index] = VoterTallyMap[VoterTallyRegistry.GetHashByIndex(i)];
                index++;
            }
            unchecked {
                i++;
            }
        }
        return voters;
    }

    /**
     * @notice Retrieve a list of approved vibes.
     * @param limit The number of vibes to return.
     * @param offset The starting index for pagination.
     * @return An array of VoteTally structs representing approved vibes.
     */
    function showActiveVibes(uint limit, uint offset) external view returns (VoteTally[] memory) {
        uint tallyCount = VoterTallyRegistry.Count();
        uint approvedCount;

        for (uint i = offset; i < tallyCount && approvedCount < limit; ) {
            if (VoterTallyMap[VoterTallyRegistry.GetHashByIndex(i)].approved) {
                approvedCount++;
            }
            unchecked {
                i++;
            }
        }

        VoteTally[] memory voters = new VoteTally[](approvedCount);
        uint index = 0;

        for (uint i = offset; i < tallyCount && index < limit; ) {
            if (VoterTallyMap[VoterTallyRegistry.GetHashByIndex(i)].approved) {
                voters[index] = VoterTallyMap[VoterTallyRegistry.GetHashByIndex(i)];
                index++;
            }
            unchecked {
                i++;
            }
        }
        return voters;
    }

    /**
     * @notice Cast a vote on a proposal.
     * @param classAddress The address of the proposal class being voted on.
     * @dev Requires the caller to hold a VibePass.
     * The user can only vote once per proposal.
     */
    function vote(address classAddress) external nonReentrant {
        VoteTally storage Vote = VoterTallyMap[classAddress];

        if (vibePass.tokenIdByOwner(msg.sender) == 0) {
            revert NeedAVibePass();
        }

        if (!voterRegistryMap[Vote.index][msg.sender]) {
            voterRegistryMap[Vote.index][msg.sender] = true;

            if (accessControl.checkRole(msg.sender, AuthLib.Rank.GLADIATOR)) {
                Vote.voteTotal += 1;
            }
            if (accessControl.checkRole(msg.sender, AuthLib.Rank.LEGATUS)) {
                Vote.voteTotal += 1;
            }
            if (accessControl.checkRole(msg.sender, AuthLib.Rank.SENATOR)) {
                Vote.voteTotal += 1;
            }
            if (accessControl.checkRole(msg.sender, AuthLib.Rank.PREATORMAXIMUS)) {
                Vote.voteTotal += 1;
            }

            emit VoteCast(msg.sender, classAddress, Vote.voteTotal);
        } else {
            revert AlreadyVoted(msg.sender, classAddress);
        }
    }

    /**
     * @notice Check if a vote has passed and, if so, register the class in VibeRegistry.
     * @param classAddress The address of the class proposal being checked.
     * @dev Only callable by a Senator.
     */
    function checkVotes(address classAddress) external nonReentrant onlySenator {
        VoteTally storage Vote = VoterTallyMap[classAddress];

        if (!Vote.approved) {
            if (Vote.voteTotal > Vote.totalNft / denominator) {
                if (Vote.rewards) {
                    classReg.addClass(classAddress, 4, Vote.process);
                } else {
                    classReg.addClass(classAddress, Vote.classType, Vote.process);
                }
                Vote.approved = true;
                emit VoteChecked(classAddress, true, Vote.voteTotal);
            } else {
                revert AlreadyPassed(classAddress);
            }
        } else {
            revert AlreadyPassed(classAddress);
        }
    }

    /**
     * @notice Propose a new vote for a class.
     * @param proposal The struct containing proposal details.
     * @param classAddress The address of the proposed class.
     * @dev Requires the proposer to hold a VibePass and that the classAddress is a contract.
     * Reverts if the class has already been proposed.
     */
    function propose(VoteProposal memory proposal, address classAddress) external nonReentrant {
        if (vibePass.tokenIdByOwner(msg.sender) == 0) {
            emit ProposalFailed(msg.sender, classAddress, "VibePass required");
            revert NeedAVibePass();
        }

        if (proposal.classAddress != classAddress) {
            revert ClassAddressNotMatch(proposal.classAddress, classAddress);
        }

        // Check that the provided classAddress is a contract
        if (!classAddress.isContract()) {
            revert NotAContract(classAddress);
        }

        if (!VoterTallyRegistry.Contains(classAddress)) {
            VoterTallyRegistry.Register(classAddress);

            VoteTally storage newVote = VoterTallyMap[classAddress];
            newVote.index = VoterTallyRegistry.Count();
            newVote.classAddress = classAddress;
            newVote.totalNft = vibePass.totalSupply();
            newVote.timestampStart = block.timestamp;
            newVote.name = proposal.name;
            newVote.process = proposal.process;
            newVote.description = proposal.description;
            newVote.classType = proposal.classType;
            newVote.rewards = proposal.rewards;

            emit VoteProposed(msg.sender, classAddress, proposal.name, proposal.description, proposal.classType, proposal.process, proposal.rewards);
        } else {
            emit ProposalFailed(msg.sender, classAddress, "Already proposed");
            revert AlreadyProposed(classAddress);
        }
    }
}
