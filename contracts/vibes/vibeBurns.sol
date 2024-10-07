// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./VibeBase.sol";
import "./IShaStorage.sol";
import '../XUSD.sol';



/**
 * @title WhitelistedAddressTaxCalculator
 * @dev A tax calculator that imposes a tax unless both the sender and recipient are whitelisted.
 */
contract vibeBurns is VibeBase, IVibeCalculator {
  
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
    ) external override onlyConsul {
        (uint64 Eta, uint64 Kappa) = Cow.Cone().React(
            userAura,
            Cow.Rod().View().Channel
        );

 storageUnit.saveToStorage(
                    userAura,
                    Kappa,
                    -500
                );
    //    uint burns = XUSD(0xbbeA78397d4d4590882EFcc4820f03074aB2AB29).burnBalanceEOA(tx.origin);

    //    if(burns > 500000 * 1e18){
    //          storageUnit.saveToStorage(
    //                 userAura,
    //                 Kappa,
    //                 -500
    //             );
    //    }
       

  
    }
}
