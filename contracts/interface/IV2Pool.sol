// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.24;
interface IV2Pool {
    function getReserves()
        external
        view
        returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);

    function swap(uint256 amount0Out, uint256 amount1Out, address to, bytes calldata data) external;
}
