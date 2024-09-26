// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./AddressReg.sol";
import "./registry.sol";
import "./Classes/VibeBase.sol";
import "./IERC20.sol";
import "./AccessorMod.sol";
import "./Classes/VibeBase.sol";
import "./IPancackePair.sol";
import "./epochManager.sol";
import "../solidity/dysnomia/00b_vmreq.sol";


/**
 * @title RewardDistributor
 * @notice Distributes rewards to users based on liquidity provision and trading volume.
 * Manages rewards using an epoch system and ensures users do not exceed defined limits.
 */
contract RewardDistributor is EpochManager, AccesorMod, VibeBase {
    using LibRegistryAdd for LibRegistryAdd.Registry;
    using LibRegistry for LibRegistry.Registry;

    // Event declarations
    event Withdrawn(address indexed user, uint256 amount);
    event DistributeTokens(address indexed user, uint256 amount);
    event LpAdded(address indexed lpAddress, address indexed router);
    event VariablesChanged(
        uint maxForLp,
        uint maxForTotal,
        uint maxForUser,
        uint multiplier,
        int vibeLimit,
        uint randomMultiplier,
        uint divisor
    );
    event MultiplierChange(uint maxForUser);
    event RewardCalculated(address indexed user, uint amount, uint epoch, address indexed lpAddress);

    // State variables
    uint256 public totalSupply; /// @notice Total token pool available for rewards
    uint256 public dailyMax = 1_500_000 * 1e18; /// @notice Maximum tokens distributed daily
    uint256 public dailyMaxPerLp = 250_000 * 1e18; /// @notice Max tokens per LP per day
    uint256 public dailyMaxPerUserLp = 2_500 * 1e18; /// @notice Max tokens per user per LP per day
    uint256 public swapMultiplier = 1000;
    uint public randomMultiplier = 100;
    uint public divisor = 4;
    int public vibeLimit = 450;
    address public xusd; /// @notice Address of XUSD token
    uint public sellMultiplier = 3e18;
    uint public buyMultiplier = 1e18;
    VMREQ public maths; /// @notice External math library
    uint256 public immutable maxValue = 450;
    uint public globalEpoch; /// @notice Current epoch

    LibRegistryAdd.Registry userRepo;
    LibRegistryAdd.Registry lpRepo;

    mapping(uint => uint) public dailyRewards;
    mapping(address => mapping(uint => bool)) public userHasWithdrawn;
    mapping(address => mapping(uint => mapping(uint => UserGains))) public dailyUserTotalRewards;
    mapping(address => mapping(address => uint)) public hashKeyStorage;
    mapping(address => mapping(uint => uint)) public dailyVolume;
    mapping(address => mapping(uint => uint)) public dailyLpRewards;
    mapping(address => bool) public lpList;
    mapping(address => bool) public submitted;
    mapping(address => WhitelistedLp) public whitelistedLpMap;
    WhitelistedLp[] public whitelistedLp;
    uint256 private locked = 1;

    struct UserGains {
        uint vibes;
        uint totalRewards;
        uint hashKeyLp;
        address lpAddress;
        bool maxed;
        uint accumulatedVolume;
    }

    struct WhitelistedLp {
        address lpAddress;
        address router;
    }

    struct VariableSettings {
        uint dailyMax;
        uint dailyMaxPerLp;
        uint dailyMaxPerUserLp;
        uint swapMultiplier;
        int vibeLimit;
        uint randomMultiplier;
        uint divisor;
    }

    address owner;
    uint[] epochArray;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    modifier updateEpoch() {
        if (getCurrentEpoch() > globalEpoch) {
            globalEpoch = getCurrentEpoch();
            epochArray.push(globalEpoch);
        }
        _;
    }

    constructor(
        address _xusd,
        address _access,
        address _maths,
        VibeInfo memory _id
    ) EpochManager(21600) VibeBase(_id, _access) {
        xusd = _xusd;
        owner = msg.sender;
        maths = VMREQ(_maths);
        globalEpoch = getCurrentEpoch();
        epochArray.push(globalEpoch);
    }

    /**
     * @notice Gets the inverse of a given number.
     * @param i Input number
     * @return uint256 Inverse result as `maxValue - i + 1`
     */
    function getInverse(uint256 i) public pure returns (uint256) {
        require(i > 0 && i <= maxValue, "Input out of bounds");
        return maxValue - i + 1;
    }

    /**
     * @notice Allows updating of epoch length.
     * @param length New epoch length in seconds
     */
    function changeEpochLength(uint length) external onlyConsul {
        epochDuration = length;
    }

    function changeBuySellMultipliers(uint buy, uint sell)external onlyConsul(){
        buyMultiplier = buy;
        sellMultiplier = sell;
    }

    function getDatesArray() external view returns (uint[] memory) {
        return epochArray;
    }

    /**
     * @notice Updates various variable settings for reward calculation.
     * @param data Struct containing the new settings
     */
    function setVariablesNumbers(VariableSettings calldata data) external onlyConsul {
        dailyMax = data.dailyMax;
        dailyMaxPerLp = data.dailyMaxPerLp;
        dailyMaxPerUserLp = data.dailyMaxPerUserLp;
        swapMultiplier = data.swapMultiplier;
        vibeLimit = data.vibeLimit;
        randomMultiplier = data.randomMultiplier;
        divisor = data.divisor;
        emit VariablesChanged(dailyMax, dailyMaxPerLp, dailyMaxPerUserLp, swapMultiplier, vibeLimit, randomMultiplier, divisor);
    }

    /**
     * @notice Deposits XUSD rewards into the contract.
     * @param amount Amount of XUSD tokens to deposit
     */
    function depositRewards(uint amount) external onlyOwner {
        require(amount > 0, "Amount must be greater than zero");
        IERC20(xusd).transferFrom(msg.sender, address(this), amount);
        totalSupply = IERC20(xusd).balanceOf(address(this));
    }

    /**
     * @notice Returns the list of whitelisted LPs.
     * @return WhitelistedLp[] Array of whitelisted LPs
     */
    function getWhitelistedLp() external view returns (WhitelistedLp[] memory) {
        return whitelistedLp;
    }

    /**
     * @notice Adds a new LP to the whitelist by an admin.
     * @param account Address of the LP
     * @param router Router address associated with the LP
     */
    function addToWhiteListAdmin(address account, address router) external onlyConsul {
        _addToWhiteList(account, router);
    }

    /**
     * @notice Adds a new LP to the whitelist by a regular user, limited to one submission.
     * @param account Address of the LP
     * @param router Router address associated with the LP
     */
    function addToWhiteList(address account, address router) external onlyLegatus {
        require(!submitted[msg.sender], "Only allowed to submit once");
        _addToWhiteList(account, router);
        submitted[msg.sender] = true;
    }

    /**
     * @notice Internal function to handle whitelisting of an LP.
     * @param account Address of the LP
     * @param router Router address associated with the LP
     */
    function _addToWhiteList(address account, address router) internal {
        require(IPancakePair(account).token0() == xusd || IPancakePair(account).token1() == xusd, "XUSD is not in that LP");
        lpRepo.Register(account);
        whitelistedLp.push(WhitelistedLp({lpAddress: account, router: router}));
        whitelistedLpMap[account] = WhitelistedLp({lpAddress: account, router: router});
        emit LpAdded(account, router); // Emit event when LP is added to whitelist
    }

    /**
     * @notice Calculates and distributes rewards based on trading activity.
     * @param _to Address of the recipient
     * @param _from Address of the sender
     * @param caller Address of the caller
     * @param sender Address that signed the transaction
     * @param _amount Amount of tokens
     * @param vibes Vibe score of the user
     */
    function calculateRewards(
        address _to,
        address _from,
        address caller,
        address sender,
        uint256 _amount,
        int256 vibes
    ) external updateEpoch onlyConsul nonReentrant() {
  
        _processRewards(_from, _amount, vibes, false);
        _processRewards(_to, _amount, vibes, true);
    }

    /**
     * @notice Helper function to process rewards for LPs.
     * @param lpAddress Address of the LP
     * @param amount Amount of tokens involved in the transaction
     * @param vibes Vibe score of the user
     * @param sell True if it's a sell transaction, false otherwise
     */
    function _processRewards(address lpAddress, uint256 amount, int256 vibes, bool sell) internal {
        if (!lpRepo.Contains(lpAddress)) return;
        dailyVolume[lpAddress][globalEpoch] += amount;

        uint _hashKey = _getOrCreateHashKey(tx.origin, lpAddress);

        if (dailyLpRewards[lpAddress][globalEpoch] >= dailyMaxPerLp) return;
        if (dailyRewards[globalEpoch] >= dailyMax) return;
        if (vibes > vibeLimit || amount <= maths.Random() * swapMultiplier) return;

        UserGains storage userGains = dailyUserTotalRewards[tx.origin][globalEpoch][_hashKey];
        if (userRepo.Contains(tx.origin)) {
            _updateExistingUserGains(userGains, amount, vibes, sell);
        } else {
            userRepo.Register(tx.origin);
            _initializeUserGains(userGains, lpAddress, amount, vibes, sell);
        }

        emit RewardCalculated(tx.origin, userGains.totalRewards, globalEpoch, lpAddress); // Emit event for calculated rewards
    }

    /**
     * @notice Internal function to update existing user gains.
     * @param userGains The user's existing rewards data
     * @param amount The amount of the transaction
     * @param vibes Vibe score of the user
     * @param sell True if it's a sell transaction, false otherwise
     */
    function _updateExistingUserGains(UserGains storage userGains, uint256 amount, int256 vibes, bool sell) internal {
        if (userGains.maxed) return;

        userGains.accumulatedVolume += amount;
        uint value = calculateRandomRewards(uint(vibes), sell, amount);
    
        if (value + userGains.totalRewards >= dailyMaxPerUserLp) {
            value = dailyMaxPerUserLp - userGains.totalRewards;
            userGains.maxed = true;
        }

        userGains.totalRewards += value;
        dailyLpRewards[userGains.lpAddress][globalEpoch] += value;
    }

    /**
     * @notice Internal function to initialize user gains.
     * @param userGains The user's gains data to initialize
     * @param lpAddress Address of the LP
     * @param amount Amount of the transaction
     * @param vibes Vibe score of the user
     * @param sell True if it's a sell transaction, false otherwise
     */
    function _initializeUserGains(UserGains storage userGains, address lpAddress, uint256 amount, int256 vibes, bool sell) internal {
        uint value = calculateRandomRewards(uint(vibes), sell, amount);
   
        if (value >= dailyMaxPerUserLp) {
            value = dailyMaxPerUserLp;
            userGains.maxed = true;
        }
        userGains.vibes = uint(vibes);
        userGains.totalRewards = value;
        userGains.lpAddress = lpAddress;
        userGains.accumulatedVolume = amount;

        dailyLpRewards[lpAddress][globalEpoch] += value;
    }

    /**
     * @notice Internal function to retrieve or create a hash key for a user-LP pair.
     * @param user Address of the user
     * @param lpAddress Address of the LP
     * @return uint Hash key for the user-LP pair
     */
    function _getOrCreateHashKey(address user, address lpAddress) internal returns (uint) {
        uint _hashKey = hashKeyStorage[user][lpAddress];
        if (_hashKey == 0) {
            _hashKey = maths.hashWith(user, lpAddress);
            hashKeyStorage[user][lpAddress] = _hashKey;
        }
        return _hashKey;
    }

    /**
     * @notice Calculates random rewards based on user vibes and trade amount.
     * @param vibes Vibe score of the user
     * @param sell Whether the transaction is a sell
     * @param amount The amount of tokens traded
     * @return uint The calculated reward value
     */
    function calculateRandomRewards(uint vibes, bool sell, uint amount) internal returns (uint) {
        uint value = (amount * getInverse(vibes) * maths.Random()) / (sell ? sellMultiplier : buyMultiplier);
        dailyRewards[globalEpoch] += value > dailyMaxPerUserLp ? dailyMaxPerUserLp : value;
     
        return value;
    }

    /**
     * @notice Allows users to withdraw their rewards.
     */
    function withdraw() external nonReentrant() {
        uint totalValue = 0;

        for (uint i = 0; i < epochArray.length - 1; i++) {
            if (!userHasWithdrawn[msg.sender][epochArray[i]]) {
                totalValue += _calculateUserRewards(msg.sender, epochArray[i]);
                userHasWithdrawn[msg.sender][epochArray[i]] = true;
            }
        }

        require(totalValue > 0, "No Rewards Available");
        require(totalValue <= IERC20(xusd).balanceOf(address(this)), "Insufficient contract balance");

        IERC20(xusd).transfer(msg.sender, totalValue);
        emit Withdrawn(msg.sender, totalValue); // Emit event for successful withdrawal
    }

    /**
     * @notice Calculates the total rewards available to a user for a specific epoch.
     * @param user The address of the user
     * @param epoch The epoch number
     * @return uint Total reward value
     */
    function _calculateUserRewards(address user, uint epoch) internal view returns (uint) {
        uint totalValue = 0;
        for (uint j = 0; j < whitelistedLp.length; j++) {
            uint hashKey = hashKeyStorage[user][whitelistedLp[j].lpAddress];
            totalValue += dailyUserTotalRewards[user][epoch][hashKey].totalRewards;
        }
        return totalValue;
    }

    /**
     * @notice Retrieves the total balance of rewards a user is entitled to across all epochs and whitelisted LPs.
     * @param user The address of the user whose reward balance is being checked.
     * @return totalValue The total unclaimed reward balance for the user.
     */
    function getUserBalance(address user) external view returns (uint256) {
        uint totalValue = 0;

        for (uint i = 0; i < epochArray.length - 1; i++) {
            if (!userHasWithdrawn[user][epochArray[i]]) {
                for (uint j = 0; j < whitelistedLp.length; j++) {
                    uint hashKey = hashKeyStorage[user][whitelistedLp[j].lpAddress];
                    UserGains memory userGains = dailyUserTotalRewards[user][epochArray[i]][hashKey];
                    
                    totalValue += userGains.totalRewards;
                }
            }
        }



        return totalValue;
    }

    /**
     * @notice Retrieves the user's trading data and rewards for a specific epoch and LP.
     * @param lpAddress The address of the liquidity provider (LP) in question.
     * @param user The address of the user whose trading data is being queried.
     * @param epoch The specific epoch for which the data is requested.
     * @return A `UserGains` struct containing the user's trading data and reward information for the given LP and epoch.
     */
    function getUserTradingDataRewards(
        address lpAddress,
        address user,
        uint epoch
    ) external view returns (UserGains memory) {
        uint _hashKey = hashKeyStorage[user][lpAddress];
        return dailyUserTotalRewards[user][epoch][_hashKey];
    }

    /// @notice Fallback function to receive ETH
    receive() external payable {}
}
