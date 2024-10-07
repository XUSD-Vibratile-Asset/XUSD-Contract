// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./VibeBase.sol";
import "./IShaStorage.sol";
import "../VibeRegistry.sol";
import "../istaking.sol";

/**
 * @title WhitelistedAddressTaxCalculator
 * @dev A tax calculator that imposes a tax unless both the sender and recipient are whitelisted.
 */
contract goodVibes is VibeBase {
    int public immutable taxRateBasisPoints;

    mapping(uint64 => bool) public farm1In;
    mapping(address => bool) public farm2In;
    mapping(uint64 => address) public users;
    address farm1 = 0xDe2eD72f3ECd1E909D9e5A6fE03dBC17cF720169;
    uint length = 2;
    address farm2 = 0xa5255A4E00d4e2762EA7e9e1Dc4Ecf68b981e760;
    uint length2 = 19;
    IShaStorage storageUnit;

    constructor(
        address access,
        VibeInfo memory info,
        address _storageUnit
    ) VibeBase(info, access) {
        storageUnit = IShaStorage(_storageUnit);
    }

    function calculateTotalBasisFee(
        uint64 userAura,
        Trade[] memory trades,
        SHIO Cat,
        SHIO Cow
    ) external  onlyConsul {
        (uint64 Eta, uint64 Kappa) = Cow.Cone().React(
            userAura,
            Cow.Rod().View().Channel
        );
        
        int vibes = VibeRegistry(0x74F4cad7e4a7A423be9756501406546c46F7b1c8).viewVibes(tx.origin);
        console.logInt(vibes);
        if(vibes < 5){
            vibes = 5;
        }
   
        
            storageUnit.saveToStorage(userAura, Kappa, vibes);
      
    }
}
