// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "../../solidity/dysnomia/01_dysnomia_v2.sol";
import "../../solidity/dysnomia/lib/reactions_core.sol";
import "../AddressReg.sol";
import "../IERC20.sol";

contract TradingRewards  {
 //   string public constant Type = "Trading Rewards";

    using LibRegistryAdd for LibRegistryAdd.Registry;

  //  CHOINTERFACE public Cho;
    uint256 public Waat;
    uint64 public RoundNumber;
    uint256 private RoundStartTime;
    uint16 public Prize;
    uint256 public currentDay;
    uint8 private MinTraders;
    uint8 private RoundMinutes;
    uint8 private ActivityThreshold;
    bool public Active;

    address[] public lpAddresses;
    uint256 public lpIndex = 0;
    uint256[] public dateArray;
    uint256 public dateIndex = 0;

    LibRegistryAdd.Registry internal WhitelistedContractsRepo;
    mapping(address => bool) public whitelist;

    struct TraderReward {
        uint64 soul;
        uint256 tradeCount;
        uint256 rewards;
    }
        uint64 constant public MotzkinPrime = 953467954114363;

    struct Trader {
        LibRegistryAdd.Registry userRepoInner;
        mapping(address => uint256) userAmounts;
    }

uint Entropy;
    mapping(address => User) private Delegates;
    address xusd;
    mapping(address => mapping(uint256 => Trader))  dailyBuyAmounts;
    mapping(address => mapping(uint256 => Trader))  dailySellAmounts;
    uint distributedToday;
    mapping(uint64 => TraderReward) private traderRewards;
    mapping(uint64 => User) private _traders;
      mapping(uint64 => bool) private dateMap;
      address _owner;
    uint64[] private _activeTraders;
    /// @dev Modifier to restrict access to the contract owner
    modifier onlyOwner() {
        require(msg.sender == _owner, "Only owner can call this function");
        _;
    }
     //  uint64 constant public MotzkinPrime = 953467954114363;
    constructor(address XUSD) {
    //  owner = msg.sender;
    //     Waat = this.Luo();
  
    xusd =XUSD;
       
        Prize = 1000;  // Initial prize amount
        SetRoundMinutes(10);  // Rounds last for 10 minutes
        SetMinTraders(1);  // Minimum number of traders to start a round
        SetActivityThreshold(3);  // Minimum number of trades required in 24 hours
    }

    function SetRoundMinutes(uint8 _minutes) public onlyOwner {
        RoundMinutes = _minutes;
    }

    function SetMinTraders(uint8 _minTraders) public onlyOwner {
        MinTraders = _minTraders;
    }

    function SetActivityThreshold(uint8 _threshold) public onlyOwner{
        ActivityThreshold = _threshold;
    }

    function ActiveTraders() public view returns (uint256) {
        return _activeTraders.length;
    }

    event JoinedTrader(uint64 Soul, string Username);

    // function Join(address UserToken) public {
    //     User memory Alpha = COREREACTIONSLIB.Enter(UserToken);
    //     if (_traders[Alpha.Soul].Soul == Alpha.Soul) return;

    //     _activeTraders.push(Alpha.Soul);
    //     emit JoinedTrader(Alpha.Soul, Alpha.Username);
       
    //     _traders[Alpha.Soul] = Alpha;

    //     if (!Active && _activeTraders.length >= MinTraders) {
    //         NewRound();
    //     }
    // }

    // function Leave() public {
    //     uint64 _soul = COREREACTIONSLIB.GetUserSoul();
    //     if (_traders[_soul].Soul == _soul) {
    //         _removeTraderBySoul(_soul);
    //     }
    // }

    function _removeTraderBySoul(uint64 Soul) internal {
        for (uint16 i = 0; i < _activeTraders.length; i++) {
            if (_activeTraders[i] == Soul) {
                delete traderRewards[_activeTraders[i]];
                delete _traders[_activeTraders[i]];
                _activeTraders[i] = _activeTraders[_activeTraders.length - 1];
                _activeTraders.pop();
                return;
            }
        }
    }

    // Whitelist LPs and router addresses
    function whitelistLP(address lpAddress, address routerAddress) external {
        require(lpAddress != address(0), "Invalid LP address");
        require(routerAddress != address(0), "Invalid Router address");
        require(!whitelist[lpAddress], "LP already whitelisted");

        whitelist[lpAddress] = true;
        lpAddresses.push(lpAddress);
    }

    event NewTrade(uint64 Soul, string Username, uint256 TradeTime);

    function RecordTrade(uint64 Soul) public {
        require(Active, "No active round");

        TraderReward storage trader = traderRewards[Soul];
        trader.tradeCount += 1;

        emit NewTrade(Soul, _traders[Soul].Username, block.timestamp);
        if (block.timestamp >= (RoundStartTime + 24 hours)) {
            EndRound();
        }
    }

    /**
     * @notice Calculates and distributes rewards based on trades and React logic.
     * @dev The function processes trades where either `_to` or `_from` is a whitelisted contract,
     *      and distributes rewards if the vibes score is within the allowed range.
     */
    function calculateRewards(
        address _to,
        address _from,
        address caller,
        address sender,
        uint256 _amount,
        int256 vibes
    ) external {
        uint256 today = setCurrentDate();

        if (WhitelistedContractsRepo.Contains(_from) && vibes <= 2000) {
            Trader storage trader = dailyBuyAmounts[_from][today];

            if (!trader.userRepoInner.Contains(tx.origin)) {
                trader.userRepoInner.Register(tx.origin);
            }

            // (uint64 omicron, uint64 omega) = modExp64(uint64(uint160(tx.origin) % MotzkinPrime), uint64(_amount), MotzkinPrime);
            // trader.userAmounts[tx.origin] += _amount;

            // uint256 rewardAmount = (_amount * omicron) / omega;
            distributeReward(tx.origin, _amount);
        }

        if (WhitelistedContractsRepo.Contains(_to) && vibes <= 2000) {
            Trader storage trader = dailySellAmounts[_to][today];

            if (!trader.userRepoInner.Contains(tx.origin)) {
                trader.userRepoInner.Register(tx.origin);
            }

            // (uint64 omicron, uint64 omega) = modExp64(uint64(uint160(tx.origin) % MotzkinPrime), uint64(_amount), MotzkinPrime);
            // trader.userAmounts[tx.origin] += _amount;

            // uint256 rewardAmount = (_amount * omicron) / omega;
            distributeReward(tx.origin, _amount);
        }
    }
 
    /**
     * @notice Calculates the total reward for a trader based on their trade count and React logic.
     * @param _soul The soul of the trader.
     * @return rewardAmount The calculated reward amount for the trader.
     */
    function CalculateReward(uint64 _soul) internal returns (uint256 rewardAmount) {
        TraderReward storage trader = traderRewards[_soul];

        // React logic to calculate reward based on trade activity and threshold
        if (trader.tradeCount >= ActivityThreshold) {
       //     (uint64 omicron, uint64 omega) = modExp64(_soul, uint64(trader.tradeCount), MotzkinPrime);

            // Calculate reward proportional to trade count and React logic (omicron and omega)
           // rewardAmount = (Prize * trader.tradeCount * omicron) / omega;
        } else {
          //  rewardAmount = 0;  // No reward if activity threshold is not met
        }
    }

    /**
     * @notice Distributes calculated rewards to the trader.
     * @param traderAddress The address of the trader receiving the reward.
     * @param rewardAmount The amount of rewards to distribute.
     */
    function distributeReward(address traderAddress, uint256 rewardAmount) internal {
        require(rewardAmount > 0, "No rewards to distribute");

        // Assuming _mint or another mechanism to transfer reward tokens
        //_mint(traderAddress, rewardAmount);
    }

    /**
     * @notice Helper function to get the current "completed period" or day.
     * @return uint256 The current period or day in the contract.
     */
    function getCurrentCompletedPeriod() public view returns (uint256) {
        // Assuming 1 day = 86400 seconds
        return block.timestamp / 1 days;
    }

    // Helper function to get the current date period for tracking
    function setCurrentDate() internal returns (uint256) {
        uint256 completedPeriod = getCurrentCompletedPeriod();

        if (!dateMap[uint64(completedPeriod)]) {
            dateArray.push(completedPeriod);
            dateMap[uint64(completedPeriod)] = true;
            distributedToday = 0;  // Reset distributed tokens for the day
        }

        return completedPeriod;
    }
  function GetUserSoul() public view returns(uint64) {
        if(Delegates[tx.origin].Soul == 0) 
        return Delegates[tx.origin].Soul;
    }

    event RewardClaimed(uint64 Soul, string Username, uint256 RewardAmount);

    function ClaimReward() public {
        uint64 _soul = GetUserSoul();
        require(traderRewards[_soul].tradeCount > 0, "No trades made");

        uint256 reward = CalculateReward(_soul);
     
        IERC20(xusd).transfer(_traders[_soul].On.Phi, reward);
        emit RewardClaimed(_soul, _traders[_soul].Username, reward);

        traderRewards[_soul].rewards += reward;
        traderRewards[_soul].tradeCount = 0;
    }

    event RoundStarted(uint64 RoundNumber);

    function NewRound() internal {
        RoundNumber += 1;
        RoundStartTime = block.timestamp;
        Active = true;
        emit RoundStarted(RoundNumber);
    }

    event RoundEnded(uint64 RoundNumber);

    function EndRound() internal {
        Active = false;
        emit RoundEnded(RoundNumber);

        for (uint16 i = 0; i < _activeTraders.length; i++) {
            ClaimReward();
        }

        NewRound();
    }

    function GetTrader(uint64 Soul) public view returns (TraderReward memory) {
        return traderRewards[Soul];
    }

    event LogEvent(uint256 Waat, uint64 Soul, uint64 Aura, string LogLine);


    // function Reactor() public view returns(LIBCOREREACTIONS) {
    //     return LIBCOREREACTIONS(Void.GetLibraryAddress("corereactions"));
    // }
    // function Recall(User memory Alpha) internal returns (uint64 UserEntropy) {
    //     (On.Omicron, On.Omega) = Reactor().ReactToLai(On, Entropy ^ Alpha.On.Omicron, Entropy ^ Alpha.On.Omega);
    //     Entropy = On.Omega;
    //     return On.Omicron;
    // }
    // function ReactUser(uint64 Soul, uint64 Epsilon) public returns (uint64 _omicron, uint64 _omega) {

    //     User memory Alpha = Delegates[_traders[Soul].Soul];
    //   //  Epsilon = Recall(Alpha);
    //     (Alpha.On.Omicron, Alpha.On.Omega) = COREREACTIONSLIB.ReactShioCone(Alpha.On.Shio, Epsilon);
    //     Delegates[_traders[Soul].Soul[Soul]] = Alpha;
    //      Entropy = Alpha.On.Omicron;
    //     return (Alpha.On.Omicron, Alpha.On.Omega);
    // }

    // function ReactTrader(uint64 Soul, uint64 Theta) public returns (uint64 Omicron, uint64 Omega) {
    //     if (_traders[Soul].Soul == 0) revert NotPlaying(_traders[Soul].Soul);

    //     (_traders[Soul].On.Omicron, _traders[Soul].On.Omega) = COREREACTIONSLIB.Reactor().ReactShioRod(COREREACTIONSLIB.Shio(), _traders[Soul].On.Omicron ^ Theta);
    //     return COREREACTIONSLIB.Reactor().ReactShioRod(COREREACTIONSLIB.Shio(), COREREACTIONSLIB.Omicron() ^ _traders[Soul].On.Omega);
    // }
      function modExp(uint256 _b, uint256 _e, uint256 _m) public returns (uint256 result) {
        assembly {
            // Free memory pointer
            let pointer := mload(0x40)

            // Define length of base, exponent and modulus. 0x20 == 32 bytes
            mstore(pointer, 0x20)
            mstore(add(pointer, 0x20), 0x20)
            mstore(add(pointer, 0x40), 0x20)

            // Define variables base, exponent and modulus
            mstore(add(pointer, 0x60), _b)
            mstore(add(pointer, 0x80), _e)
            mstore(add(pointer, 0xa0), _m)

            // Store the result
            let value := mload(0xc0)

            // Call the precompiled contract 0x05 = bigModExp
            if iszero(call(not(0), 0x05, 0, pointer, 0xc0, value, 0x20)) {
                revert(0, 0)
            }

            result := mload(value)
        }
    }
        function modExp64(uint64 _b, uint64 _e, uint64 _m) public returns(uint64 result) {
        uint256 B = _b;
        uint256 E = _e;
        uint256 M = _m;
        uint64 R = uint64(modExp(B, E, M) % 18446744073709551615);
        return R;
    }

    error NotPlaying(uint64 Soul);
}
