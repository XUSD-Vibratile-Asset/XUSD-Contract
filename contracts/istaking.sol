// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./interface/IERC20.sol";

/**
 * @title IXusdGenesisRewardPool
 * @dev Interface for the XusdGenesisRewardPool contract.
 */
interface IXusdGenesisRewardPool {

    struct UserInfo {
        uint256 amount;
        uint256 rewardDebt;
    }

    struct PoolInfo {
        IERC20 token;
        uint256 allocPoint;
        uint256 lastRewardTime;
        uint256 accXusdPerShare;
        bool isStarted;
        uint256 maxDeposit;
    }

    // View functions

    /**
     * @notice Returns the number of commission tokens.
     */
    function comissionTokensCount() external view returns (uint256);

    /**
     * @notice Returns the address of a commission token at the given index.
     * @param index The index of the commission token.
     */
    function comissionToken(uint256 index) external view returns (address);

    /**
     * @notice Returns the pending XUSD rewards for a specific user and pool.
     * @param _pid The pool ID.
     * @param _user The user address.
     */
    function pendingXusd(uint256 _pid, address _user) external view returns (uint256);

    /**
     * @notice Returns the reward generated between two timestamps.
     * @param _fromTime Start time.
     * @param _toTime End time.
     */
    function getGeneratedReward(uint256 _fromTime, uint256 _toTime) external view returns (uint256);

    /**
     * @notice Allows governance to recover unsupported tokens.
     * @param _token The token to recover.
     * @param amount The amount to recover.
     * @param to The recipient address.
     */
    function governanceRecoverUnsupported(IERC20 _token, uint256 amount, address to) external;

    // Mutative functions

    /**
     * @notice Adds a new pool to the reward pool.
     * @param _allocPoint The allocation points for the pool.
     * @param _token The token for the pool.
     * @param _withUpdate Whether to update all pools.
     * @param _lastRewardTime The last reward time.
     * @param _maxDeposit The maximum deposit for the pool.
     */
    function add(uint256 _allocPoint, IERC20 _token, bool _withUpdate, uint256 _lastRewardTime, uint256 _maxDeposit) external;

    /**
     * @notice Allows a user to deposit tokens into a pool.
     * @param _pid The pool ID.
     * @param _amount The amount to deposit.
     */
    function deposit(uint256 _pid, uint256 _amount) external;

    /**
     * @notice Allows a user to withdraw tokens from a pool.
     * @param _pid The pool ID.
     * @param _amount The amount to withdraw.
     */
    function withdraw(uint256 _pid, uint256 _amount) external;

    /**
     * @notice Allows a user to withdraw tokens from a pool in case of emergency.
     * @param _pid The pool ID.
     */
    function emergencyWithdraw(uint256 _pid) external;

    /**
     * @notice Updates allocation points for a pool.
     * @param _pid The pool ID.
     * @param _allocPoint The new allocation points.
     */
    function set(uint256 _pid, uint256 _allocPoint) external;

    /**
     * @notice Updates the operator of the pool.
     * @param _operator The new operator address.
     */
    function setOperator(address _operator) external;

    /**
     * @notice Mass update of all pools.
     */
    function massUpdatePools() external;

    /**
     * @notice Updates a specific pool.
     * @param _pid The pool ID.
     */
    function updatePool(uint256 _pid) external;

    /**
     * @notice Safely transfers XUSD to a specified address.
     * @param _to The recipient address.
     * @param _amount The amount to transfer.
     */
    function safeXusdTransfer(address _to, uint256 _amount) external;
}
