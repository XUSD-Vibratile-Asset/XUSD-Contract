// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title PrecisePercentageTokenDistributor
 * @dev A contract that passively accepts ERC20 token transfers and distributes them to team members based on percentages out of 10,000 (for 4 decimal precision).
 */
contract PrecisePercentageTokenDistributor is Ownable {
    using SafeERC20 for IERC20;

    IERC20 public immutable token;  // The ERC20 token that will be distributed.
    uint256 public totalPercentage; // Total percentage distributed among team members (should always be 10,000).

    // Percentage precision factor to represent values with 4 decimal places (e.g., 25.5% = 2550).
    uint256 public constant PERCENTAGE_FACTOR = 10000;

    struct TeamMember {
        uint256 percentage;  // The percentage of tokens this member should receive (out of 10,000).
        uint256 claimed;     // The amount of tokens this member has already claimed.
        bool isMember;       // Indicates if the address is a registered team member.
    }

    mapping(address => TeamMember) public team;
    address[] public teamMembers;  // List of all team members' addresses.

    /// @dev Emitted when a team member is added or updated.
    event TeamMemberAdded(address indexed member, uint256 percentage);

    /// @dev Emitted when a team member is removed.
    event TeamMemberRemoved(address indexed member);

    /// @dev Emitted when a team member claims their tokens.
    event TokensClaimed(address indexed claimant, uint256 amount);

    uint256 private locked = 1;

    modifier nonReentrant() virtual {
        require(locked == 1, "REENTRANCY");

        locked = 2;

        _;

        locked = 1;
    }
    /**
     * @dev Sets the ERC20 token that will be distributed.
     * @param _token The ERC20 token contract address.
     */
    constructor(address _token)Ownable(msg.sender) {
        require(_token != address(0), "Invalid token address");
        token = IERC20(_token);
    }

    /**
     * @notice Adds or updates a team member's percentage allocation.
     * @dev Only the contract owner can add or update team members.
     * @param member The address of the team member.
     * @param percentage The percentage of tokens this team member should receive (out of 10,000).
     */
    function addOrUpdateTeamMember(address member, uint256 percentage) external onlyOwner {
        require(member != address(0), "Invalid team member address");
        require(percentage > 0 && percentage <= PERCENTAGE_FACTOR, "Percentage must be between 1 and 10,000");
        require(totalPercentage + percentage <= PERCENTAGE_FACTOR, "Total percentage exceeds 10,000");

        if (!team[member].isMember) {
            teamMembers.push(member);
            team[member].isMember = true;
        }

        // Update the total percentage allocation.
        totalPercentage = totalPercentage - team[member].percentage + percentage;
        team[member].percentage = percentage;

        emit TeamMemberAdded(member, percentage);
    }

    /**
     * @notice Removes a team member.
     * @dev Only the owner can remove team members.
     * @param member The address of the team member to remove.
     */
    function removeTeamMember(address member) external onlyOwner {
        require(team[member].isMember, "Address is not a team member");

        // Deduct the member's percentage from the total allocation.
        totalPercentage -= team[member].percentage;

        team[member].isMember = false;
        team[member].percentage = 0;

        // Find and remove the team member from the list.
        for (uint256 i = 0; i < teamMembers.length; i++) {
            if (teamMembers[i] == member) {
                teamMembers[i] = teamMembers[teamMembers.length - 1];
                teamMembers.pop();
                break;
            }
        }

        emit TeamMemberRemoved(member);
    }

    /**
     * @notice Allows a team member to claim their allocated tokens based on the percentage.
     * @dev The claimant can only claim the tokens proportional to their percentage.
     */
    function claimTokens() external nonReentrant{
        require(team[msg.sender].isMember, "Caller is not a team member");

        uint256 claimable = _claimableAmount(msg.sender);
        require(claimable > 0, "No tokens to claim");

        team[msg.sender].claimed += claimable;
        token.safeTransfer(msg.sender, claimable);

        emit TokensClaimed(msg.sender, claimable);
    }

    /**
     * @notice Calculates the claimable amount for a specific team member.
     * @dev This calculates based on the percentage of the total tokens in the contract, minus the amount already claimed.
     * @param member The address of the team member.
     * @return The amount of tokens the member can claim.
     */
    function _claimableAmount(address member) internal view returns (uint256) {
        uint256 contractBalance = token.balanceOf(address(this));
        uint256 totalClaimableForMember = (contractBalance * team[member].percentage) / PERCENTAGE_FACTOR;
        uint256 claimable = totalClaimableForMember - team[member].claimed;
        return claimable;
    }

    /**
     * @notice Returns the list of team members.
     * @return The array of team member addresses.
     */
    function getTeamMembers() external view returns (address[] memory) {
        return teamMembers;
    }
}