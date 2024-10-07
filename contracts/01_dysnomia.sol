// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.21;
import "./multiownable.sol";


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


    uint64 constant public MotzkinPrime = 953467954114363;
    atropaMath public Xiao;
    uint256 public maxSupply;
    mapping(address => uint256) private _marketRates;

    constructor(address mathContract) MultiOwnable(msg.sender) {
       
        Xiao = atropaMath(mathContract);
      
   
    }










    function _approve(address owner, address spender, uint256 value) internal {
        _approve(owner, spender, value, true);
    }

    function _approve(address owner, address spender, uint256 value, bool emitEvent) internal virtual {
        _allowances[owner][spender] = value;
        if (emitEvent) {
            emit Approval(owner, spender, value);
        }
    }


    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    error DysnomiaInsufficientBalance(address origin, address sender, address from, address to, address what, uint256 balance, uint256 needed);
    error DysnomiaInsufficientAllowance(address origin, address sender, address owner, address spender, address what, uint256 allowance, uint256 needed);

    function log10(uint256 value) internal pure returns (uint256) {
        uint256 result = 0;
        unchecked {
            for(uint8 _e = 64; _e >= 1; _e /= 2) {
                if (value >= 10 ** _e) {
                    value /= 10 ** _e;
                    result += _e;
                }
            }
        }
        return result;
    }

    function String(uint256 value) internal pure returns (string memory buffer) {
        unchecked {
            uint256 length = log10(value) + 1;
            buffer = new string(length);
            uint256 ptr;
            assembly { ptr := add(buffer, add(32, length)) }
            while (true) {
                ptr--;
                assembly { mstore8(ptr, byte(mod(value, 10), "0123456789abcdef")) }
                value /= 10;
                if (value == 0) break;
            }
        }
    }

    function Hex(address account) internal pure returns(string memory) {
        return Hex(abi.encodePacked(account));
    }

    function Hex(uint256 value) internal pure returns(string memory) {
        return Hex(abi.encodePacked(value));
    }

    function Hex(bytes32 value) internal pure returns(string memory) {
        return Hex(abi.encodePacked(value));
    }

    function Hex(bytes memory data) internal pure returns(string memory) {
        bytes memory hexa = "0123456789abcdef";

        bytes memory str = new bytes(2 + data.length * 2);
        str[0] = "0";
        str[1] = "x";
        for (uint i = 0; i < data.length; i++) {
            str[2+i*2] = hexa[uint(uint8(data[i] >> 4))];
            str[3+i*2] = hexa[uint(uint8(data[i] & 0x0f))];
        }
        return string(str);
    }
}
