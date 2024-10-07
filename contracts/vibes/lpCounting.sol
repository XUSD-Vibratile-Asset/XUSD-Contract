// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./fixy.sol";
import "../math/atropamath.sol";
import "../Trade.sol";
import {SD59x18, sd} from "@prb/math/src/SD59x18.sol";
import "../03b_shiointerface.sol";
import "../staking.sol";
import "hardhat/console.sol";
import "./IShaStorage.sol";
import "./VibeBase.sol";
import "../unorderedAddress.sol";

interface IVibeCalculator {
    struct trading {
        address to;
        address from;
        uint amount;
        uint userAura;
        uint previousHash;
    }

    function calculateTotalBasisFee(
        uint64 userAura,
        Trade[] memory trades,
        SHIO Cat,
        SHIO Cow
    ) external;
}

interface ILPToken {
    function token0() external view returns (address);
    function token1()
        external
        view
        returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

interface lpTracker {
    function getAllLpBalances(
        address user
    ) external view returns (uint256[] memory);
}

/**
 * @title LPVibeTracker
 * @dev Tracks and stores LP token balances of users as "vibes".
 * Also checks farming contracts for LP token deposits and adjusts user balances accordingly.
 */
contract LPVibeTracker is VibeBase, IVibeCalculator {
    using HitchensUnorderedAddressSetLib for HitchensUnorderedAddressSetLib.Set;

    struct Data {
        bool checked;
        uint balance;
    }

    struct UserData {
        HitchensUnorderedAddressSetLib.Set users;
        mapping(address => uint) balances;
    }

    mapping(address => uint) internal addressToPid;
    mapping(address => UserData) internal lpBalancesUser;
    mapping(address => mapping(address => Data)) public lastLPBalances;
    uint64 public constant MOTZKIN_PRIME = 953467954114363;
    address public XUSD; // Address of XUSD token
    mapping(address => bool) public lps; // LP tokens mapping
    mapping(uint => mapping(uint => Data)) public lpBalances;
    mapping(uint64 => mapping(uint => uint256)) public lpBalancesAfter;
    mapping(address => int) private lpVibes; // Store LP vibes locally

    IShaStorage storageUnit;
    lpTracker storageLp = lpTracker(0xcfE92B95A14df7AD7Cc0F94277fd088FA008a20b);

    lpIndexer[] public lpIndex;
    lpIndexerFarms[] public lpIndexFarm;

    struct lpIndexer {
        uint64 _hash;
        address contractAddress;
    }

    struct lpIndexerFarms {
        uint64 _hash;
        address contractAddress;
        uint pid;
    }

    uint public length;
    int public limit = 250;

    address public farmContracts = 0xDe2eD72f3ECd1E909D9e5A6fE03dBC17cF720169;

    constructor(
        address access,
        VibeInfo memory info,
        address _storageUnit
    ) VibeBase(info, access) {
        storageUnit = IShaStorage(_storageUnit);
        initializeLpIndexes();
    }

    /**
     * @dev Initializes predefined LP tokens into the index.
     */
    function initializeLpIndexes() internal {
        // Pre-populate with known LP tokens
        addLpInternal(0xEB5c0C2f096604a62585eE378f664fBF6620B5a5);
        addressToPid[0xEB5c0C2f096604a62585eE378f664fBF6620B5a5] = 3;
        addLpInternal(0x96b7E2E6C459BdDdD933d6f20ccfA82F7EE8B1F3);
        addressToPid[0x96b7E2E6C459BdDdD933d6f20ccfA82F7EE8B1F3] = 4;
        addLpInternal(0xE99f4094e013dCDD58731F453990Cd0eE44Fe0a7);
        addressToPid[0xE99f4094e013dCDD58731F453990Cd0eE44Fe0a7] = 5;
        addLpInternal(0x79fC0e8d904F7145d7eD2F1E74B96c806e9BF249);
        addressToPid[0x79fC0e8d904F7145d7eD2F1E74B96c806e9BF249] = 1;
        addLpInternal(0x804494bf520640Ff04E31263e776422d1A846882);
        addressToPid[0x804494bf520640Ff04E31263e776422d1A846882] = 0;
    }

    /**
     * @dev Internal function to add an LP token.
     */
    function addLpInternal(address _token) internal {
        lpIndexer memory lp = lpIndexer({
            contractAddress: _token,
            _hash: generateAura(_token)
        });
        lps[_token] = true;
        lpIndex.push(lp);
    }

    /**
     * @dev Internal function to add an LP farm token.
     */
    function addLpFarm(address _token, uint _pid) internal {
        lpIndexerFarms memory lpFarm = lpIndexerFarms({
            contractAddress: _token,
            _hash: generateAura(_token),
            pid: _pid
        });
        lps[_token] = true;
        lpIndexFarm.push(lpFarm);
        addressToPid[_token] = _pid;
    }

    /**
     * @dev Adds an LP token to the index.
     * @param _token The LP token address to add.
     */
    function addLp(address _token) external onlyConsul {
        require(_token != address(0), "Invalid LP token address");
        addLpInternal(_token);
    }

    /**
     * @dev Adds an LP farm token.
     * @param _token The LP token address to add.
     * @param pid The farming pool ID associated with the token.
     */
    function addLp2(address _token, uint pid) external onlyConsul {
        require(_token != address(0), "Invalid LP token address");
        addLpFarm(_token, pid);
    }

    /**
     * @dev Generates an aura based on the user's address.
     * @param user The user address.
     * @return uint64 A pseudo-random aura value.
     */
    function generateAura(address user) public pure returns (uint64) {
        return uint64(uint256(uint160(user))) % MOTZKIN_PRIME;
    }

    /**
     * @dev Calculates total basis fee based on user's trades.
     * @param userAura The aura value of the user.
     * @param trades List of trade objects.
     * @param Cat SHIO contract.
     * @param Cow SHIO contract.
     */
    function calculateTotalBasisFee(
        uint64 userAura,
        Trade[] memory trades,
        SHIO Cat,
        SHIO Cow
    ) external onlyConsul {
        console.log("Calculation started");
        for (uint i = 0; i < lpIndex.length; ) {
            if (
                !lastLPBalances[tx.origin][lpIndex[i].contractAddress].checked
            ) {
                console.logBool(
                    lastLPBalances[tx.origin][lpIndex[i].contractAddress]
                        .checked
                );
                updateLpBalance(userAura, i);
            }
            unchecked {
                i++;
            }
        }

        checkTrade(trades, userAura, Cow);
    }

    /**
     * @dev Updates LP balance for a user.
     * @param userAura The user's aura.
     * @param index The index of the LP token.
     */
    function updateLpBalance(uint64 userAura, uint index) internal {
        address lpAddress = lpIndex[index].contractAddress;
        Data storage lastData = lastLPBalances[tx.origin][lpAddress];

        uint currentBalance = IERC20(lpAddress).balanceOf(tx.origin);
        uint totalSupply = IERC20(lpAddress).totalSupply();

        lastData.checked = true;
        lastData.balance = currentBalance;
        console.logBool(lastLPBalances[tx.origin][lpAddress].checked);
        (uint balanceInFarm, ) = XusdGenesisRewardPool(farmContracts).userInfo(
            addressToPid[lpAddress],
            tx.origin
        );
        console.logUint(balanceInFarm);
        currentBalance += balanceInFarm;

        uint256 userShare = (currentBalance * 1e18) / totalSupply;
        int wins = int((int(userShare) * -limit)) / 1e18;
        console.logInt(wins);
        if (wins < -limit) wins = -limit;
        if (wins > 0) wins = 0;

        storageUnit.saveToStorage(
            generateAura(tx.origin),
            lpIndex[index]._hash,
            wins
        );
    }

    /**
     * @dev Processes a set of trades and adjusts the vibe score accordingly.
     */
    function checkTrade(
        Trade[] memory trades,
        uint64 userAura,
        SHIO Cow
    ) internal {
        uint sumRun = 0;
        bool isSell = false;
        bool isBuy = false;
        address lpSelect = address(0);
        uint lpHash = 0;
        for (uint i = 0; i < trades.length; ) {
            console.logAddress(trades[i].to);
            if (lps[trades[i].to] || lps[trades[i].from]) {
                sumRun += trades[i].amount;
                isSell = lps[trades[i].to];
                isBuy = lps[trades[i].from];
                lpHash = generateAura(
                    lps[trades[i].to] ? trades[i].to : trades[i].from
                );
            }
            lpSelect = lps[trades[i].to] ? trades[i].to : trades[i].from;
            console.logUint(lpHash);
            unchecked {
                i++;
            }
        }

 

        sumRun = trades.length > 0 ? sumRun / trades.length : 0;
        int totalAdjustment = 0;

 

        if (isSell) totalAdjustment = calculateSellAdjustment(sumRun);
        if (isBuy) totalAdjustment = calculateBuyAdjustment(sumRun);
        console.logInt(totalAdjustment);
        int vibes = storageUnit.sumVibesForAura(userAura, tx.origin);
        //console.logInt(vibes);
        if (vibes + totalAdjustment < 200 || vibes + totalAdjustment > 700) {
            totalAdjustment = 0;
        }

                   if (lps[lpSelect]) {

            if (
                lastLPBalances[tx.origin][lpSelect].balance <
                IERC20(lpSelect).balanceOf(tx.origin)
            ) {
        
                (uint Eta, uint64 Kappa) = Cow.Cone().React(
                    uint64(lpHash),
                    Cow.Rod().View().Channel
                );
                totalAdjustment = calculateBuyAdjustment(sumRun);
                storageUnit.addToStorage(userAura, Kappa, totalAdjustment);
                return;
            }


            if (
                lastLPBalances[tx.origin][lpSelect].balance >
                IERC20(lpSelect).balanceOf(tx.origin)
            ) {
            
                (uint Eta, uint64 Kappa) = Cow.Cone().React(
                    uint64(lpHash),
                    Cow.Rod().View().Channel
                );
                totalAdjustment = calculateSellAdjustment(sumRun);
                storageUnit.addToStorage(userAura, Kappa, totalAdjustment);
                return;
            }
        }
        if (lpHash != 0) {
            //  console.logInt(totalAdjustment);
            (uint Eta, uint64 Kappa) = Cow.Cone().React(
                uint64(lpHash),
                Cow.Rod().View().Channel
            );
            console.logUint(Kappa);
            storageUnit.addToStorage(userAura, Kappa, totalAdjustment);
        }
    }

    /**
     * @dev Calculates adjustment for a sell transaction.
     */
    function calculateSellAdjustment(uint256 sum) internal pure returns (int) {
        console.logUint(sum);
        if (sum < 1000 * 1e18) {
            return 2;
        } else if (sum < 5000 * 1e18) {
            return 3;
        } else {
            return 6;
        }
    }

    /**
     * @dev Calculates adjustment for a buy transaction.
     */
    function calculateBuyAdjustment(uint256 sum) internal pure returns (int) {
        console.logUint(sum);
        if (sum < 1000 * 1e18) {
            return -1;
        } else if (sum < 5000 * 1e18) {
            return -2;
        } else {
            return -3;
        }
    }
}
