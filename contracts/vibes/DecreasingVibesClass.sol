// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "../staking.sol";
import "../math/atropamath.sol";
import "../AddressReg.sol";
import './VibeBase.sol';
import "./vibesBank.sol";
/**
 * @title WhitelistedAddressTaxCalculator
 * @dev A tax calculator that imposes a tax unless both the sender and recipient are whitelisted.
 */
contract DecreasingOnBuys is VibeBase {




    mapping(address => bool) public lps;
 

    VibeBank _bank;
   


    constructor(address access, VibeInfo memory info, address bank) VibeBase(info, access){
_bank = VibeBank(bank);
    }

function addLp(address _lp) external onlyConsul{

lps[_lp] = true;
}
    function calculateTotalBasisFee(
        address addy,
        uint amount
    ) external  override returns (int) {
            if(amount > 5000 * 1e18){

         if(lps[addy]){
                  _bank.updateVibes(tx.origin, -5);             

        
        }
            }
        return 0;

    }
}

