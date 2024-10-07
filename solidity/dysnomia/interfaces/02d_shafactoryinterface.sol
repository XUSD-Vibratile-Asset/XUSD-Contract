// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.21;
import ".//02b_shainterface.sol";

interface SHAFactory {
    function New(address MathLib) external returns(SHA);
}