// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "../staking.sol";
import "../math/atropamath.sol";
import "../registry.sol";
import './VibeBase.sol';
interface ITaxCalculator {
    function calculateTotalBasisFee(
        address origin,
        uint amount
    ) external returns (int);
}
/**
 * @title WhitelistedAddressTaxCalculator
 * @dev A tax calculator that imposes a tax unless both the sender and recipient are whitelisted.
 */
contract whitelistedRouter is VibeBase {
    using AtropaMath for address;
    int public immutable taxRateBasisPoints;
    mapping(address => bool) public farm1In;
    mapping(address => bool) public farm2In;
    address farm1 = 0x453ab7510fb3e138333f326D2e4E89B829Cb7185;
   

    constructor(address access, VibeInfo memory info) VibeBase(info, access){}

    function calculateTotalBasisFee(
        address addy,
        uint amount
    ) external view override returns (int) {
      return 50;
    }
}

