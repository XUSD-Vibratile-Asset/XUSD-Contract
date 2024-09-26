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
contract genesisPoolUser is VibeBase {
    using AtropaMath for address;
    int public immutable taxRateBasisPoints;
    mapping(address => bool) public farm1In;
    mapping(address => bool) public farm2In;
    address farm1 = 0xDe2eD72f3ECd1E909D9e5A6fE03dBC17cF720169;
    uint length = 2;
    address farm2 = 0xa5255A4E00d4e2762EA7e9e1Dc4Ecf68b981e760;
    uint length2 = 19;

    constructor(address access, VibeInfo memory info) VibeBase(info, access){}

    function calculateTotalBasisFee(
        address addy,
        uint amount
    ) external view override returns (int) {
        for (uint i; i < length; ) {
            (uint _amount, ) = XusdGenesisRewardPool(farm1).userInfo(i, tx.origin);
            if (_amount > 0) {
                return -50;
            }
            unchecked{
                i ++;
            }
        }

        for (uint i; i < length2; ) {
            (uint _amount, ) = XusdGenesisRewardPool(farm2).userInfo(i, tx.origin);
            if (_amount > 0) {
                return -50;
            }
            unchecked{
                i++;
            }
        }
        return 0;
    }
}
