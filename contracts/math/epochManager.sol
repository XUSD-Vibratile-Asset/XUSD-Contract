// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/**
 * @title EpochManager
 * @dev This contract handles an epoch system where the epoch increments automatically every set period.
 * Epochs are based on a global start time, and the current epoch is determined by time elapsed.
 */
contract EpochManager {

    /// @notice The timestamp when the epoch system started.
    uint256 public epochStartTime;

    /// @notice The duration of each epoch in seconds. In this case, one day (86400 seconds).
    uint256 public  epochDuration;



    /**
     * @dev Initializes the contract with a start time and sets the epoch duration.
     * @param _epochDuration Duration of one epoch in seconds, e.g., 86400 for one day.
     */
    constructor(uint256 _epochDuration) {
   
        epochStartTime = block.timestamp; // Set the initial epoch start time to the current block time.
        epochDuration = _epochDuration;
    }



    /**
     * @notice Returns the current epoch number based on the elapsed time.
     * @dev The epoch number increments by 1 every `epochDuration` seconds.
     * @return uint256 The current epoch number.
     */
    function getCurrentEpoch() public view returns (uint256) {
        return (block.timestamp - epochStartTime) / epochDuration;
    }


 

}
