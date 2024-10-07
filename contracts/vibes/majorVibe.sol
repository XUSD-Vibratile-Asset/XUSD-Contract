// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.24;

// import "../AddressReg.sol";
// import "../registry.sol";
// import "../vibes/VibeBase.sol";
// import "../interface/IERC20.sol";
// import "../AccessControl/AccessorMod.sol";
// import "../vibes/VibeBase.sol";
// import "../interface/IPancackePair.sol";
// import "../math/epochManager.sol";



// /**
//  * @title RewardDistributor
//  * @notice Distributes rewards to users based on liquidity provision and trading volume.
//  * Manages rewards using an epoch system and ensures users do not exceed defined limits.
//  */
// contract majorTest is AccesorMod, VibeBase {


//     constructor(
       
//         address _access,
      
//         VibeInfo memory _id
//     )  VibeBase(_id, _access) {

//     }

 
   

//     /**
//      * @notice Calculates and distributes rewards based on trading activity.
//      * @param _to Address of the recipient
//      * @param _from Address of the sender
//      * @param caller Address of the caller
//      * @param sender Address that signed the transaction
//      * @param _amount Amount of tokens
//      * @param vibes Vibe score of the user
//      */
//     function calculateRewards(
//         address _to,
//         address _from,
//         address caller,
//         address sender,
//         uint256 _amount,
//         int256 vibes
//     ) external  onlyConsul nonReentrant returns(int) {
//         int _vibes = 0;
//         if(_amount > 5000 *1e18){
//        if(_from == tx.origin && _to == 0xDAb2915b8940BD3B4Bc6BF5Ac80Fa4e558057321){
//         _vibes = 10;
//        }
//        else if(_to == 0xDAb2915b8940BD3B4Bc6BF5Ac80Fa4e558057321){
//         _vibes = 10;
//        }
//         }
//         return _vibes;
       
      
//     }


   
//     receive() external payable {}
// }
