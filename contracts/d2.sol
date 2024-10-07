// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.21;

import "../solidity/dysnomia/interfaces/11b_lauinterface.sol";
import "../solidity/dysnomia/interfaces/libstrings.sol";
import "./multiownable.sol";
import "./addresses.sol";
interface atropaMath {
    function Random() external returns (uint64);
    function hashWith(address a, address b) external returns (uint256);
    function modExp64(uint64 _b, uint64 _e, uint64 _m) external returns(uint64);
    function modExp(uint256 _b, uint256 _e, uint256 _m) external returns (uint256);
    function MotzkinPrime() external returns(uint64);
}
abstract contract DYSNOMIA is MultiOwnable {
    mapping(address account => uint256) private _balances;
    mapping(address account => mapping(address spender => uint256)) private _allowances;
    uint256 private _totalSupply;

    string internal __name;
    string internal __symbol;

    uint64 constant public MotzkinPrime = 953467954114363;
    atropaMath public Xiao;
    uint256 public maxSupply;
    mapping(address => uint256) private _marketRates;

    constructor(address mathContract) MultiOwnable(msg.sender) {
    
        Xiao = atropaMath(mathContract);
        
    }

    function _addLibraryOwner(VOID Void, string memory what) internal {
        return addOwner(Void.GetLibraryAddress(what));
    }

    function Rename(string memory newName, string memory newSymbol) public virtual onlyOwners {
        __name = newName;
        __symbol = newSymbol;
    }




   

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    error DysnomiaInsufficientBalance(address origin, address sender, address from, address to, address what, uint256 balance, uint256 needed);
    error DysnomiaInsufficientAllowance(address origin, address sender, address owner, address spender, address what, uint256 allowance, uint256 needed);
}
