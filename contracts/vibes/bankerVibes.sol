// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.26;

// import "../staking.sol";
// import "../math/atropamath.sol";
// import "./vibesBank.sol";
// import "../AddressReg.sol";
// import "./VibeBase.sol";

// /**
//  * @title WhitelistedAddressTaxCalculator
//  * @dev A tax calculator that imposes a tax unless both the sender and recipient are whitelisted.
//  */
// contract t1 is VibeBase {
 
//     mapping(address => int) public userVibes;
    

//     constructor(
//         address access,
//         VibeInfo memory info
     
//     ) VibeBase(info, access) {
    
//     }

//     function calculateTotalBasisFee(
//         address addy,
//         uint amount
//     ) external view override returns (int) {
//         return 5;
//     }

//     function updateVibes(
//         address user,
//         int vibes
//     ) external onlyConsul{
        

//         userVibes[user] = vibes;
//     }
// }
