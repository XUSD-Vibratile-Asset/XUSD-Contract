// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.26;



interface RNG {
    function Random() external returns(uint64);
}

library AtropaMath  {
    uint64 constant public MotzkinPrime = 953467954114363;

   // RNG private RandomNumberGeneratorToken;

    // ERC20 private DaiToken;
    // ERC20 private USDCToken;
    // ERC20 private USDTToken;
    // ERC20 private G5Token;
    // ERC20 private PIToken;

  //  constructor() {}

    // function Random() public returns(uint64) {
    //     if(totalSupply() <= (1111111111 * 10 ** decimals()))
    //         _mint(address(this), 1 * 10 ** decimals());
    //     return RandomNumberGeneratorToken.Random();
    // }

 function hashWith(address a, address b) public returns (uint256 hash) {        
        hash = 0;
        uint160 _a = uint160(a);
        uint160 _b = uint160(b) / 15;
        unchecked {
            while(hash == 0) {
                hash = (_a**_b)%MotzkinPrime;
                _b = _b/2;
            }
        }
        return modExp(uint256(uint160(a)), uint256(uint160(b)), MotzkinPrime);
    }


    function hashWithHash(address a, uint b) public returns (uint256 hash) {        
        hash = 0;
        uint160 _a = uint160(a);
        uint160 _b = uint160(b) / 15;
        unchecked {
            while(hash == 0) {
                hash = (_a**_b)%MotzkinPrime;
                _b = _b/2;
            }
        }
        return modExp(uint256(uint160(a)), uint256(uint160(b)), MotzkinPrime);
    }


   

    function modExp64(uint64 _b, uint64 _e, uint64 _m) public returns(uint64 result) {
        uint256 B = _b;
        uint256 E = _e;
        uint256 M = _m;
        uint64 R = uint64(modExp(B, E, M) % 18446744073709551615);
        return R;
    }

    function modExp(uint256 _b, uint256 _e, uint256 _m) public returns (uint256 result) {
        assembly {
            // Free memory pointer
            let pointer := mload(0x40)

            // Define length of base, exponent and modulus. 0x20 == 32 bytes
            mstore(pointer, 0x20)
            mstore(add(pointer, 0x20), 0x20)
            mstore(add(pointer, 0x40), 0x20)

            // Define variables base, exponent and modulus
            mstore(add(pointer, 0x60), _b)
            mstore(add(pointer, 0x80), _e)
            mstore(add(pointer, 0xa0), _m)

            // Store the result
            let value := mload(0xc0)

            // Call the precompiled contract 0x05 = bigModExp
            if iszero(call(not(0), 0x05, 0, pointer, 0xc0, value, 0x20)) {
                revert(0, 0)
            }

            result := mload(value)
        }
    }





    function sortThree(uint64 a, uint64 b, uint64 c) public pure returns (uint64, uint64, uint64) {
        // Check if all three are equal
        if (a == b && b == c) {
            return (0, 0, a); // All are equal
        }

        // Handling pairs of equal values
        if (a == b) {
            return (0, a, c > a ? c : a); // a == b
        }
        if (a == c) {
            return (0, a, b > a ? b : a); // a == c
        }
        if (b == c) {
            return (0, b, a > b ? a : b); // b == c
        }

        // All values are distinct
        if (a <= b && a <= c) {
            if (b <= c) {
                return (a, b, c); // a < b < c
            } else {
                return (a, c, b); // a < c < b
            }
        } else if (b <= a && b <= c) {
            if (a <= c) {
                return (b, a, c); // b < a < c
            } else {
                return (b, c, a); // b < c < a
            }
        } else {
            if (a <= b) {
                return (c, a, b); // c < a < b
            } else {
                return (c, b, a); // c < b < a
            }
        }
    }





}