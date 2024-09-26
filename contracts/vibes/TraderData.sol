// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.21;



interface IDayTrader {
    struct dayTraderDataTotal {
        address user;
        address LpAddress;
        uint256 day;
        uint256 totalDayWeightBuy;
        uint256 totalDayWeightSell;
        uint256 dayBuyAmount;
        uint256 daySellAmount;
    }
}