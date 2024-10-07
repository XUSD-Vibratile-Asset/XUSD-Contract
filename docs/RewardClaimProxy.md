# RewardClaimProxy









## Methods

### claimFromMultiplePools

```solidity
function claimFromMultiplePools(uint256[] pids) external nonpayable
```

Uses delegatecall to claim rewards from multiple pools while preserving msg.sender



#### Parameters

| Name | Type | Description |
|---|---|---|
| pids | uint256[] | The array of pool IDs to claim rewards from |

### rewardPoolImplementation

```solidity
function rewardPoolImplementation() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |




