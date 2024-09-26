// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./ERC721A.sol";

import "./registry.sol";
import "./math/atropamath.sol";

import "./AccessControl/Access.sol";
import "./VibeRegistry.sol";
import "./PriceDecay.sol";
import "./interface/IXUSD.sol";
import "./AccessControl/AccessorMod.sol";

/**
 * @title VibePass
 * @dev ERC721 token representing a VibePass, with additional features for handling access control, token burning, and more.
 * The contract integrates with VibeRegistry for vibe-based logic and OneSwap for purchase transactions.
 */
contract VibePass is ERC721A, AccesorMod {
    using LibRegistry for LibRegistry.Registry;
    using AtropaMath for address;

    // Role definitions

    // Custom Events
    event URIUpdated(address indexed user, string newURI);
    event UserNameUpdated(address indexed user, string newUserName);
    event XusdAddressUpdated(address indexed updater, address newXusd);
    event PassMinted(
        address indexed user,
        uint tokenId,
        uint purchaseBurnAmount
    );
    event PassTransferred(
        address indexed from,
        address indexed to,
        uint tokenId
    );
    event GladiatorRankUpdated(int newRank);
    event UserGladiatorRankUpgrade(address user);
    event OneSwapFundsWithdrawn(address indexed consul, uint amount);
    event VotesUpdated(address indexed user, uint newVotes);

    // Custom Errors
    error NotRankedForVibePass();
    error VibePassAlreadyMinted();
    error VibePassCanOnlyHoldOne();
    error VibePassNonExistent();
    error NotAllowedToTransfer();

    // Structs to hold NFT details
    struct Nft {
        address owner;
        address holder;
        string userName;
        uint tokenId;
        uint purchaseBurnAmountOrigin;
        uint currentBurnAmount;
        string url;
    }

    struct UserNft {
        address owner;
        uint tokenId;
        bool active;
    }

    // State variables
    LibRegistry.Registry private _VibePass;
    mapping(uint => Nft) internal NFTRegistry;
    mapping(address => UserNft) internal VibePassUserIndex;
    mapping(address => uint256) private _votes;
    mapping(address => uint) internal VibePassTokenIdIndex;
    mapping(address => uint) internal VibePassTokenIdOwners;
    VibeRegistry VibReg;
    int internal gladiator = 400;
    address xusd;
    address oneSwap;
    PriceSlowDecay pDecay;
    uint public purchaseAmount;
    address[] internal allUsers;
    uint public userLimit = 100; // Default user limit

    /**
     * @notice Constructor for VibePass contract.
     * @param _oneSwap The address of the OneSwap contract.
     * @param security The address of the security contract (access control).
     * @param _xusd The address of the XUSD contract.
     * @param _priceDecay The address of the PriceDecay contract.
     * @param vibes The address of the VibeRegistry contract.
     */
    constructor(
        address _oneSwap,
        address security,
        address _xusd,
        address _priceDecay,
        address vibes
    ) ERC721A("XUSD VibePass", "VibePass") AccesorMod(security) {
        oneSwap = _oneSwap;
        xusd = _xusd;
        pDecay = PriceSlowDecay(_priceDecay);
        VibReg = VibeRegistry(vibes);

        _registerPass(
            0x9E2a16AD7098b0aA23a07E49c42fe4987B6496e6,
            _nextTokenId()
        ); // Register before external call

        emit PassMinted(
            0x9E2a16AD7098b0aA23a07E49c42fe4987B6496e6,
            _nextTokenId(),
            NFTRegistry[_nextTokenId()].purchaseBurnAmountOrigin
        );
        _mint(0x9E2a16AD7098b0aA23a07E49c42fe4987B6496e6, 1);
        _registerPass(
            0xfD35CFd830ADace105280B33A911C16367EF2337,
            _nextTokenId()
        ); // Register before external call

        emit PassMinted(
            0xfD35CFd830ADace105280B33A911C16367EF2337,
            _nextTokenId(),
            NFTRegistry[_nextTokenId()].purchaseBurnAmountOrigin
        );
        _mint(0xfD35CFd830ADace105280B33A911C16367EF2337, 1);
        _registerPass(
            0xb15Cdd0084e492eBE16a1858e8c578c3c369CD99,
            _nextTokenId()
        ); // Register before external call

        emit PassMinted(
            0xb15Cdd0084e492eBE16a1858e8c578c3c369CD99,
            _nextTokenId(),
            NFTRegistry[_nextTokenId()].purchaseBurnAmountOrigin
        );
        _mint(0xb15Cdd0084e492eBE16a1858e8c578c3c369CD99, 1);
        _registerPass(
            0x248827caCedbd0d9a2169e0bC133762Bd9c8e899,
            _nextTokenId()
        ); // Register before external call

        emit PassMinted(
            0x248827caCedbd0d9a2169e0bC133762Bd9c8e899,
            _nextTokenId(),
            NFTRegistry[_nextTokenId()].purchaseBurnAmountOrigin
        );
        _mint(0x248827caCedbd0d9a2169e0bC133762Bd9c8e899, 1);
    }

    /**
     * @notice Set the gladiator rank required for VibePass minting.
     * @param vibes Minimum vibes required for gladiator rank.
     * @dev Only callable by the Consul.
     */
    function setGladiator(int vibes) external onlyConsul {
        gladiator = vibes;
        emit GladiatorRankUpdated(vibes);
    }

    /**
     * @notice Returns information about all users who own a VibePass, up to the user limit.
     * @return An array of user addresses and an array of structs containing user info.
     */
    function getAllUsersInfo() external view returns (Nft[] memory) {
        uint totalUsers = _VibePass.Count() > userLimit
            ? userLimit
            : _VibePass.Count();

        Nft[] memory userInfo = new Nft[](totalUsers);

        for (uint i = 0; i < totalUsers; i++) {
            userInfo[i] = NFTRegistry[_VibePass.GetHashByIndex(i)];
            userInfo[i].currentBurnAmount =
                IXUSD(xusd).burnBalanceEOA(userInfo[i].owner) -
                userInfo[i].purchaseBurnAmountOrigin;
        }

        return (userInfo);
    }

    /**
     * @notice Mint a new VibePass NFT for the caller if they meet the required rank.
     * @dev User can only hold one VibePass, and funds are transferred from OneSwap on minting.
     */
    function mintPass() public nonReentrant {
        if (VibePassTokenIdOwners[msg.sender] != 0) {
            revert VibePassCanOnlyHoldOne();
        }
        if (
            VibReg.viewVibes(msg.sender) <= gladiator &&
            VibReg.viewVibes(msg.sender) > 0
        ) {
            accessControl.grantRole(msg.sender, AuthLib.Rank.GLADIATOR);

            uint160 newItemId = uint160(_nextTokenId());

            if (!_VibePass.Contains(newItemId)) {
                _registerPass(msg.sender, newItemId); // Register before external call
                bool success = IERC20(oneSwap).transferFrom(
                    msg.sender,
                    address(this),
                    pDecay.getCurrentPrice()
                );
                require(success, "Transfer failed");
                _mint(msg.sender, 1);
                emit PassMinted(
                    msg.sender,
                    newItemId,
                    NFTRegistry[newItemId].purchaseBurnAmountOrigin
                );
            } else {
                revert VibePassAlreadyMinted();
            }
        } else {
            revert NotRankedForVibePass();
        }
    }
    /**
     * @dev See {IERC721-transferFrom}.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public payable virtual override(ERC721A) nonReentrant onlyConsul {
        transferFromI(from, to, tokenId);
    }

    /**
     * @dev See {IERC721-safeTransferFrom}.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public payable virtual override(ERC721A) nonReentrant onlyConsul {
        transferFromI(from, to, tokenId);
    }

    /**
     * @dev See {IERC721-safeTransferFrom}.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) public payable virtual override(ERC721A) nonReentrant onlyConsul {
        transferFromI(from, to, tokenId);
    }

    function _safeTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual nonReentrant onlyConsul {
        transferFromI(from, to, tokenId);
    }

    /**
     * @dev Same as {xref-ERC721-_safeTransfer-address-address-uint256-}[`_safeTransfer`], with an additional `data` parameter which is
     * forwarded in {IERC721Receiver-onERC721Received} to contract recipients.
     */
    function _safeTransfer(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) internal virtual nonReentrant onlyConsul {
        transferFromI(from, to, tokenId);
        // _checkOnERC721Received(from, to, tokenId, data);
    }

    /**
     * @notice Returns the VibePass information for a specific user.
     * @param user The address of the user whose VibePass information you want to retrieve.
     * @return A struct containing the user's VibePass information.
     */
    function getUserInfo(address user) external view returns (Nft memory) {
        require(
            _VibePass.Contains(VibePassTokenIdIndex[user]),
            "User does not own a VibePass"
        );

        return NFTRegistry[VibePassTokenIdIndex[user]];
    }

    /**
     * @notice Withdraw funds from OneSwap contract.
     * @dev Only callable by the Preatormaximus.
     */
    function withdrawOneswap() external onlyPreatormaximus {
        uint balance = IERC20(oneSwap).balanceOf(address(this));
        IERC20(oneSwap).transfer(msg.sender, balance);
        emit OneSwapFundsWithdrawn(msg.sender, balance);
    }

    /**
     * @notice Set a limit on how many users can be returned.
     * @param limit The new limit for how many users can be returned.
     * @dev Only callable by the Consul.
     */
    function setUserLimit(uint limit) external onlyConsul {
        require(limit > 0, "Limit must be greater than 0");
        userLimit = limit;
    }

    /**
     * @notice Set the URI for a VibePass holder.
     * @param user The address of the user whose URI is being updated.
     * @param Url The new URI.
     * @dev Only callable by the Consul.
     */
    function setURI(address user, string memory Url) public onlyConsul {
        require(
            bytes(Url).length > 0 && bytes(Url).length <= 256,
            "Invalid URI"
        );

        if (_VibePass.Contains(VibePassTokenIdIndex[user])) {
            NFTRegistry[VibePassTokenIdIndex[user]].url = Url;
            emit URIUpdated(user, Url);
        }
    }

    /**
     * @notice Set the username for the caller's VibePass.
     * @param userName The new username.
     */
    function setUserName(string memory userName) public {
        require(
            bytes(userName).length > 0 && bytes(userName).length <= 50,
            "Invalid username"
        );

        if (_VibePass.Contains(VibePassTokenIdIndex[msg.sender])) {
            NFTRegistry[VibePassTokenIdIndex[msg.sender]].userName = userName;
            emit UserNameUpdated(msg.sender, userName);
        } else {
            revert VibePassNonExistent();
        }
    }

    /**
     * @notice Set the address of the XUSD token.
     * @param _xusd The new XUSD token address.
     * @dev Only callable by the Consul.
     */
    function setXusd(address _xusd) external onlyPreatormaximus {
        xusd = _xusd;
        emit XusdAddressUpdated(msg.sender, _xusd);
    }

    /**
     * @notice Update a user's vote balance based on burn amount.
     * @param user The address of the user to update.
     */
    function UserUpdate(address user) external {
        if (_VibePass.Contains(VibePassTokenIdIndex[user])) {
            _votes[user] =
                IXUSD(xusd).burnBalanceEOA(user) -
                NFTRegistry[VibePassTokenIdIndex[user]]
                    .purchaseBurnAmountOrigin;
            emit VotesUpdated(user, _votes[user]);
        }
    }

    /**
     * @dev Internal function to register a newly minted VibePass.
     * @param user The address of the user receiving the VibePass.
     * @param id The token ID of the VibePass.
     */
    function _registerPass(address user, uint256 id) internal {
        _VibePass.Register(id);
        NFTRegistry[id] = Nft({
            tokenId: id,
            owner: user,
            holder: user,
            purchaseBurnAmountOrigin: IXUSD(xusd).burnBalanceEOA(user),
            currentBurnAmount: IXUSD(xusd).burnBalanceEOA(user),
            userName: "",
            url: ""
        });
        VibePassTokenIdOwners[user] = id;
        VibePassTokenIdIndex[user] = id;
    }

    /**
     * @dev Internal function to transfer a VibePass from one user to another.
     * @param from The address of the current owner.
     * @param to The address of the new owner.
     * @param tokenId The token ID to transfer.
     */
    function _transferVibePass(
        address from,
        address to,
        uint256 tokenId
    ) external onlyConsul nonReentrant {
        require(NFTRegistry[tokenId].owner == from, "Not token owner");

        VibePassTokenIdIndex[from] = 0;
        VibePassTokenIdIndex[to] = tokenId;
        NFTRegistry[tokenId].holder = to;

        transferFromI(from, to, tokenId);
    }

    /**
     * @notice Get the username associated with a user's VibePass.
     * @param user The address of the user.
     * @return The username of the user's VibePass.
     */
    function getUsername(address user) external view returns (string memory) {
        if (_VibePass.Contains(VibePassTokenIdIndex[user])) {
            return NFTRegistry[VibePassTokenIdIndex[user]].userName;
        }
        return "NO USERNAME";
    }

    /**
     * @notice Get the original burn amount of the VibePass.
     * @param id The token ID of the VibePass.
     * @return The original burn amount.
     */
    function getBurnAmountsEoa(uint256 id) public view returns (uint256) {
        require(NFTRegistry[id].owner != address(0), "Id does not Exist");
        return
            IXUSD(xusd).burnBalanceEOA(NFTRegistry[id].owner) -
            NFTRegistry[id].purchaseBurnAmountOrigin;
    }
}
