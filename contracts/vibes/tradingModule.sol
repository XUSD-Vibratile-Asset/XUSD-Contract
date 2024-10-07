// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


import "../math/atropamath.sol";
import "../AddressReg.sol";
import "./IShaStorage.sol";
import "hardhat/console.sol";
import './IVibeCalculator.sol';
import "./VibeBase.sol";
import "../interface/IERC20.sol";

interface ILPToken {
    function token0() external view returns (address);
    function token1() external view returns (address);
}

/**
 * @title DecreasingOnBuys
 * @dev A tax calculator that imposes a tax unless both the sender and recipient are whitelisted.
 * It processes multiple trades and calculates taxes based on LP involvement.
 * Now dynamically checks if a token is an LP token involving XUSD by querying token0 and token1.
 */
contract DecreasingOnBuys is VibeBase, IVibeCalculator {

    IShaStorage storageUnit;
    address public XUSD; // The address of the XUSD token
    mapping(address => bool) public lps; // LP tokens mapping
        struct data {
        bool checked;
        uint Balance;
    }



    mapping(address => mapping(address => data)) public lastLPBalances;
    constructor(address access, VibeInfo memory info, address _storageUnit) VibeBase(info, access) {
        storageUnit = IShaStorage(_storageUnit);
    }

    /**
     * @dev Adds an LP token address to the whitelist.
     * @param _token The LP token address to add.
     */
    function addLp(address _token) external onlyConsul {
        require(_token != address(0), "Invalid LP token address");
        lps[_token] = true;
    }

    /**
     * @dev Sets the XUSD token address.
     * @param xusd The new XUSD token address.
     */
    function setToken(address xusd) external onlyConsul {
        require(xusd != address(0), "Invalid XUSD address");
        XUSD = xusd;
    }

    /**
     * @dev Calculates total basis fee for multiple trades.
     * @param userAura The aura of the user.
     * @param trades An array of Trade structs containing information on the trades.
     * @param Cat The SHIO object related to the user.
     * @param Cow The SHIO object related to the transaction.
     */
    function calculateTotalBasisFee(
        uint64 userAura,
        Trade[] memory trades,
        SHIO Cat,
        SHIO Cow
    ) external override onlyConsul {
        (uint64 Eta, uint64 Kappa) = Cow.Cone().React(userAura, Cow.Rod().View().Channel);

        int totalAdjustment = 0;
        uint256 sum = 0;
        bool isSell = false;
        bool isBuy = false;

        for (uint256 i = 0; i < trades.length; i++) {
            Trade memory tradeIt = trades[i];

            // Check if the trade is a Sell (if 'to' address is an LP token)
            if (lps[tradeIt.to]) {
                if(lastLPBalances[tradeIt.to][tx.origin].Balance < IERC20(tradeIt.to)
                        .balanceOf(tx.origin)){

                 totalAdjustment = calculateBuyAdjustment(tradeIt.amount);
                     storageUnit.addToStorage(userAura, Kappa, int(totalAdjustment) * 2);
                     lastLPBalances[tradeIt.to][tx.origin].Balance = IERC20(tradeIt.to)
                        .balanceOf(tx.origin);
                        }

                   lastLPBalances[tradeIt.to][tx.origin].Balance = IERC20(tradeIt.to)
                        .balanceOf(tx.origin);
        
                isSell = true;
            }

            // Check if the trade is a Buy (if 'from' address is an LP token)
            if (lps[tradeIt.from]) {
                   lastLPBalances[tradeIt.from][tx.origin].Balance = IERC20(tradeIt.from)
                        .balanceOf(tx.origin);
                isBuy = true;
            }

            // Accumulate the trade amounts
            sum += tradeIt.amount;
        }

        if (trades.length > 0) {
            sum = sum / trades.length; // Calculate average trade amount
        }

        // Handle Sell scenario
        if (isSell) {
            totalAdjustment = calculateSellAdjustment(sum);
        }

        // Handle Buy scenario (negative adjustment for buys)
        if (isBuy) {
            totalAdjustment = calculateBuyAdjustment(sum);
        }

        // Retrieve total vibes for the user's aura
        int vibes = storageUnit.sumVibesForAura(userAura, tx.origin);

        // Adjust totalAdjustment if vibes are below threshold
        if (vibes < 200 ) {
            totalAdjustment = isSell || isBuy ? totalAdjustment : int(0);
        }

        // Apply the final adjustment and store the result
        storageUnit.addToStorage(userAura, Kappa, totalAdjustment);
    }

    /**
     * @dev Internal function to calculate the adjustment for sells.
     * @param sum The average trade amount.
     * @return int The adjustment value for a sell.
     */
    function calculateSellAdjustment(uint256 sum) internal pure returns (int) {
        if (sum < 1000 * 1e18) {
            return 2;
        } else if (sum < 5000 * 1e18) {
            return 3;
        } else {
            return 6;
        }
    }

    /**
     * @dev Internal function to calculate the adjustment for buys.
     * @param sum The average trade amount.
     * @return int The adjustment value for a buy.
     */
    function calculateBuyAdjustment(uint256 sum) internal pure returns (int) {
        if (sum < 1000 * 1e18) {
            return -1;
        } else if (sum < 5000 * 1e18) {
            return -2;
        } else {
            return -3;
        }
    }
}
