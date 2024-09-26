// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IXUSD {
    // IERC20 standard functions
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);

    // IERC20Metadata functions
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);

    // Burn-related functions
    function burnBalanceContract(address contractAddr) external view returns (uint256);
    function burnBalanceEOA(address user) external view returns (uint256);
    function totalBurned() external view returns (uint256);
    
    // Burn history functions
    function getLatestBurnEOA(address user) external view returns (uint224);
    function getFullBurnHistoryEOA(address user) external view returns (uint32[] memory blocks, uint224[] memory burns);
    function getLatestBurnContract(address contractAddr) external view returns (uint224);
    function getFullBurnHistoryContract(address contractAddr) external view returns (uint32[] memory blocks, uint224[] memory burns);

    // Exclusion from tax
    function setExclusionFromTax(address account, bool status) external;
    function isExcludedFromTax(address account) external view returns (bool);

    // Mint and reward transfer functions
    function mint(address to, uint256 amount) external;
    function Rewardtransfer(address to, uint256 amount) external;

    // Registry setting function
    function setRegistry(address reg) external;

    // IERC20-related events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
