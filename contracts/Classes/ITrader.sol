// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.21;
import "./TraderData.sol";


interface IWhitelistTransactionTracker {
    function getAllUsersLpDate(address lpAddress, uint256 date) external returns (IDayTrader.dayTraderDataTotal[] memory);
  function getCurrentDate() external returns (uint256);
    function getArray() external returns ( address[] memory );
   
}