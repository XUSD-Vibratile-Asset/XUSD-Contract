// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./AddressReg.sol";
import "./registry.sol";
import "./vibes/bankerVibes.sol";
import "./math/atropamath.sol";
import "./AccessControl/AccessorMod.sol";
import "./vibes/VibeBase.sol";
import "./interface/IPancackePair.sol";
import "./math/epochManager.sol";



/**
 * @title RewardDistributor
 * @notice Distributes rewards to users based on liquidity provision and trading volume.
 * Manages rewards using an epoch system and ensures users do not exceed defined limits.
 */
contract BankerTracking is AccesorMod, VibeBase {

    using AtropaMath for address;


   
  mapping(address => bool) internal lpList;


    mapping(uint  => int)  public userVibes;

    bankersRemourse _bank;


    constructor(
      
        address _access,
     
        VibeInfo memory _id
    ) VibeBase(_id, _access) {
      _bank = bankersRemourse(0x0a31e09C5B44C9f7e9984C02D58853a4da0C5618);
     
       
    }

   
    /**
     * @notice Calculates and distributes rewards based on trading activity.
     * @param _to Address of the recipient
     * @param _from Address of the sender
     * @param caller Address of the caller
     * @param sender Address that signed the transaction
     * @param _amount Amount of tokens
     * @param vibes Vibe score of the user
     */
    function calculateRewards(
        address _to,
        address _from,
        address caller,
        address sender,
        uint256 _amount,
        int256 vibes
    ) external onlyConsul nonReentrant() {

        checkingSellingXusd(_to, _amount);
        checkingBuyingXusd(_from, _amount);
        updateDatabase();
    }


function updateDatabase() internal {
    uint hash = address(this).hashWith(tx.origin);
  
        _bank.updateVibes(tx.origin,  userVibes[hash]);

}

    function checkingSellingXusd(address to, uint amount) internal {
        if(amount > 5000 *1e18){
        if(lpList[to]){
       uint hash = address(this).hashWith(tx.origin);
        userVibes[hash] += 10;

        }
        }

    }

        function checkingBuyingXusd(address from, uint amount) internal {
               if(amount > 5000 *1e18){
        if(lpList[from]){
       uint hash = address(this).hashWith(tx.origin);
        userVibes[hash] -= 5;

        }
               }

    }

    function addLp(address lp) external onlyConsul{
    
            lpList[lp] = true;
   
    }

  
}
