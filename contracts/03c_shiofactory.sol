// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.21;
import "./SHIO.sol";

contract SHIOFactory2 {
    constructor() {} 

    function New(address math) public returns(SHIO Zeta) {
        Zeta = new SHIO(math);
        Zeta.addOwner(msg.sender);
        Zeta.addOwner(tx.origin);
        Zeta.renounceOwnership(address(this));

    }
}