// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.21;
import "./02_sha.sol";

contract SHAFactory2 {
    constructor() {} 

    function New(address MathLib) public returns(SHA Eta) {
        Eta = new SHA(MathLib);
        Eta.addOwner(msg.sender);
        Eta.addOwner(tx.origin);
        Eta.renounceOwnership(address(this));
    }
}