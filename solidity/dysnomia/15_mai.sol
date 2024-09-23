// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "./01_dysnomia_v2.sol";
import "./interfaces/12b_chointerface.sol";

contract TradingRewards is DYSNOMIA {
    string public constant Type = "Trading Rewards";

    CHOINTERFACE public Cho;
    uint256 public Waat;
    uint64 public RoundNumber;
    uint256 private RoundStartTime;
    uint16 public Prize;
    uint256 public currentDay;
    uint8 private MinTraders;
    uint8 private RoundMinutes;
    uint8 private ActivityThreshold;  // Threshold for considering a trader active (e.g., number of trades)
    mapping(uint64 => User) private _traders;
    uint64[] private _activeTraders;
    bool public Active;

    struct Trade {
        address trader;
        uint256 timestamp;
    }

    struct TraderReward {
        uint64 soul;
        uint256 tradeCount;
        uint256 rewards;
    }

    mapping(uint64 => TraderReward) private traderRewards;

    constructor(address ChoAddress) DYSNOMIA(unicode"Champion", unicode"TradingRewards", address(DYSNOMIA(ChoAddress).Xiao())) {
        Cho = CHOINTERFACE(ChoAddress);
        Waat = Cho.Luo();
        Cho.addOwner(address(this));
       
        maxSupply = 11111111111111111111;
        Active = false;
        RoundNumber = 0;
        Prize = 1000;  // Initial prize amount
        SetRoundMinutes(10);  // Rounds last for 10 minutes
        SetMinTraders(5);  // Minimum number of traders to start a round
        SetActivityThreshold(3);  // Minimum number of trades required in 24 hours
    }

    function SetRoundMinutes(uint8 _minutes) public onlyOwners {
        RoundMinutes = _minutes;
    }

    function SetMinTraders(uint8 _minTraders) public onlyOwners {
        MinTraders = _minTraders;
    }

    function SetActivityThreshold(uint8 _threshold) public onlyOwners {
        ActivityThreshold = _threshold;  // Minimum number of trades to be eligible for rewards
    }

    function ActiveTraders() public view returns(uint256) {
        return _activeTraders.length;
    }

    event JoinedTrader(uint64 Soul, string Username);
    
    function Join(address UserToken) public {
        User memory Alpha = Cho.Enter(UserToken);
        if (_traders[Alpha.Soul].Soul == Alpha.Soul) return;
        
        _activeTraders.push(Alpha.Soul);
        emit JoinedTrader(Alpha.Soul, Alpha.Username);
        Log(Alpha.Soul, Cho.Void().Nu().Aura(), string.concat("New Trader Joined :: ", Alpha.Username));
        _traders[Alpha.Soul] = Alpha;
        if (!Active && _activeTraders.length >= MinTraders) NewRound();
    }

    function Leave() public {
        uint64 _soul = Cho.GetUserSoul();
        if (_traders[_soul].Soul == _soul)
            _removeTraderBySoul(_soul);
    }

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

    event NewTrade(uint64 Soul, string Username, uint256 TradeTime);
    
    function RecordTrade(uint64 Soul) public {
        require(Active, "No active round");
        
        TraderReward storage trader = traderRewards[Soul];
        trader.tradeCount += 1;  // Increment trade count for the trader
        
        emit NewTrade(Soul, _traders[Soul].Username, block.timestamp);
        if (block.timestamp >= (RoundStartTime + 24 hours)) EndRound();  // End round after 24 hours
    }

    function CalculateReward(uint64 Soul) view  internal returns (uint256) {
        TraderReward storage trader = traderRewards[Soul];
        
        // Reward calculation based on the number of trades during the 24-hour period
        if (trader.tradeCount >= ActivityThreshold) {
            uint256 reward = Prize * trader.tradeCount / ActivityThreshold;
            return reward;
        }
        
        return 0;  // No reward if activity threshold is not met
    }

    event RewardClaimed(uint64 Soul, string Username, uint256 RewardAmount);

    function ClaimReward() public {
        uint64 _soul = Cho.GetUserSoul();
        require(traderRewards[_soul].tradeCount > 0, "No trades made");
        
        uint256 reward = CalculateReward(_soul);
        _mint(_traders[_soul].On.Phi, reward);
        emit RewardClaimed(_soul, _traders[_soul].Username, reward);
        
        traderRewards[_soul].rewards += reward;
        traderRewards[_soul].tradeCount = 0;  // Reset trade count after claiming rewards
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

        // Distribute rewards to all active traders
        for (uint16 i = 0; i < _activeTraders.length; i++) {
            ClaimReward();
        }

        // Start a new round after distributing rewards
        NewRound();
    }

    function GetTrader(uint64 Soul) public view returns (TraderReward memory) {
        return traderRewards[Soul];
    }

    event LogEvent(uint256 Waat, uint64 Soul, uint64 Aura, string LogLine);
    
    function Log(uint64 Soul, uint64 Aura, string memory LogLine) internal {
        emit LogEvent(Waat, Soul, Aura, LogLine);
    }

    function OperatorSendMSG(string memory chatline) public onlyOwners {
        Log(0, Cho.Void().Nu().Aura(), string.concat(chatline));
    }

    function ReactTrader(uint64 Soul, uint64 Theta) public returns (uint64 Omicron, uint64 Omega) {
        if (_traders[Soul].Soul == 0) revert NotPlaying(_traders[Soul].Soul);
        (_traders[Soul].On.Omicron, _traders[Soul].On.Omega) = Cho.Reactor().ReactShioRod(Cho.Shio(), _traders[Soul].On.Omicron ^ Theta);
        return Cho.Reactor().ReactShioRod(Cho.Shio(), Cho.Omicron() ^ _traders[Soul].On.Omega);
    }

    error NotPlaying(uint64 Soul);
}

