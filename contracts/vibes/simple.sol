// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.24;

// import "./IVibeCalculator.sol";
// import "../AccessControl/AccessorMod.sol";


// /**
//  * @title BaseClass
//  * @dev This is an abstract base class contract that includes basic functionalities for user activation and class basis management.
//  */
//  contract VibeBase1 is IVibeCalculator, AccesorMod {
//     mapping(uint => bool) public UserActiveList;

//     string public description;
//     enum Importance {
//         Low,  // 0
//         Medium, // 1
//         High      // 2
//     }
//     struct VibeInfo {
//         address creatorAddress;
//         string info;
//         Importance level;
//     }
 
//     VibeInfo public id;


//     constructor(VibeInfo memory _id, address access) AccesorMod(access) {
       
//         id = _id;

//     }

//     function setBaseImportance(Importance level) external {
  
//         id.level = level;
//     }

//     function getLevel() public view returns(Importance){
//         return id.level;
//     }



//     function getDescription() external view returns (string memory) {
//         return description;
//     }

//     function calculateTotalBasisFee(
//         address addy,
//         uint amount
//     ) external virtual nonReentrant returns (int) {

//        return 470;
//     }
// }
