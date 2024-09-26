// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "../staking.sol";
import "../math/atropamath.sol";
import "../AddressReg.sol";
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
contract VibeBank is VibeBase {
    using AtropaMath for address;
    using LibRegistryAdd for LibRegistryAdd.Registry;

    struct CurrentTrade {
        bool started;

    }
    LibRegistryAdd.Registry internal lpRegistry;
     LibRegistryAdd.Registry internal userReg;
    mapping(address => bool) public lps;
    mapping(address => CurrentTrade) public userStart;
    mapping(address => int) public userVibes;

   


    constructor(address access, VibeInfo memory info) VibeBase(info, access){

        
    }

    function updateVibes(
        address user,
   int vibes
    ) external onlyConsul returns  (int) {
           


            
                    if(userReg.Contains(user)){
                        userVibes[user] += vibes;
                        return userVibes[user];
                    }
                    else{
                        userReg.Register(user);
                        userVibes[user] = vibes;
                        return userVibes[user];
                    }


                
        
    
}
}

