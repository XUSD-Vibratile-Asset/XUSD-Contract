// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.26;

// import "./VibeBase.sol";
// import "./IShaStorage.sol";
// import "../staking.sol";


// /**
//  * @title WhitelistedAddressTaxCalculator
//  * @dev A tax calculator that imposes a tax unless both the sender and recipient are whitelisted.
//  */
// contract genesisPoolUser is VibeBase {
  
//     int public immutable taxRateBasisPoints;
 
//     mapping(uint64 => bool) public farm1In;
//     mapping(address => bool) public farm2In;
//     mapping(uint64 => address) public users;
//     address farm1 = 0xDe2eD72f3ECd1E909D9e5A6fE03dBC17cF720169;
//     uint length = 2;
//     address farm2 = 0xa5255A4E00d4e2762EA7e9e1Dc4Ecf68b981e760;
//     uint length2 = 19;
//    IShaStorage storageUnit;

//     constructor(
//         address access,
//         VibeInfo memory info,
//         address _storageUnit
//     ) VibeBase(info, access) {
//          storageUnit = IShaStorage(_storageUnit);
//     }

//     function calculateTotalBasisFee(
//         uint64 userAura,
//         Trade[] memory trades,
//         SHIO Cat,
//         SHIO Cow
//     ) external override onlyConsul {
//         (uint64 Eta, uint64 Kappa) = Cow.Cone().React(
//             userAura,
//             Cow.Rod().View().Channel
//         );


//    for (uint i = 0; i < trades.length; i++) {
//             Trade memory tradeIt = trades[i];
     
     
          
// for (uint l; l < length; ) {
//             (uint _amount, ) = XusdGenesisRewardPool(farm1).userInfo(
//                 l,
//                 tx.origin
//             );
//             if (_amount > 0) {
//              farm1In[Eta] = true;
//                 storageUnit.saveToStorage(
//                     userAura,
//                     Kappa,
//                     -50
//                 );
//             }
//             unchecked {
//                 l++;
//             }
//         }

//         for (uint j; j < length2; ) {
//             (uint _amount, ) = XusdGenesisRewardPool(farm2).userInfo(
//                 j,
//                 tx.origin
//             );
//             if (_amount > 0) {
//                  farm1In[Eta] = true;
//             storageUnit.saveToStorage(
//                     userAura,
//                     Kappa,
//                     -50
//                 );
//             }
//             unchecked {
//                 i++;
//             }
//         }

//          storageUnit.saveToStorage(
//                     userAura,
//                     Kappa,
//                     0
//                 );

//             }

          
        
//     }
// }
