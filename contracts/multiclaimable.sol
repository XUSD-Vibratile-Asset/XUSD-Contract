// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Interface for the XusdGenesisRewardPool contract
interface IXusdGenesisRewardPool {
    function withdraw(uint256 _pid, uint256 _amount) external;
    function deposit(uint256 _pid, uint256 _amount) external;
}

contract RewardClaimProxy {
    address public rewardPoolImplementation;

    constructor(address _rewardPoolImplementation) {
        rewardPoolImplementation = _rewardPoolImplementation;
    }

    /**
     * @notice Uses delegatecall to claim rewards from multiple pools while preserving msg.sender
     * @param pids The array of pool IDs to claim rewards from
     */
    function claimFromMultiplePools(uint256[] calldata pids) external {
        for (uint256 i = 0; i < pids.length; i++) {
            // Use delegatecall to call the withdraw function in the XusdGenesisRewardPool contract
            (bool success, ) = rewardPoolImplementation.delegatecall(
                abi.encodeWithSignature("withdraw(uint256,uint256)", pids[i], 0)
            );
            //require(success, "Delegatecall failed");
        }
    }
}
