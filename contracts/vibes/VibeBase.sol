// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


import "../AccessControl/AccessorMod.sol";


/**
 * @title BaseClass
 * @dev This is an abstract base class contract that includes basic functionalities for user activation and class basis management.
 */
abstract contract VibeBase is  AccesorMod {
    mapping(uint => bool) public UserActiveList;

    string public description;

    struct VibeInfo {
        address creatorAddress;
        string info;
    
    }

    VibeInfo public id;

    constructor(VibeInfo memory _id, address access) AccesorMod(access) {
        id = _id;
    }



  
    function getDescription() external view returns (string memory) {
        return id.info;
    }



}
