# EpochManager



> EpochManager



*This contract handles an epoch system where the epoch increments automatically every set period. Epochs are based on a global start time, and the current epoch is determined by time elapsed.*

## Methods

### epochDuration

```solidity
function epochDuration() external view returns (uint256)
```

The duration of each epoch in seconds. In this case, one day (86400 seconds).




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### epochStartTime

```solidity
function epochStartTime() external view returns (uint256)
```

The timestamp when the epoch system started.




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getCurrentEpoch

```solidity
function getCurrentEpoch() external view returns (uint256)
```

Returns the current epoch number based on the elapsed time.

*The epoch number increments by 1 every `epochDuration` seconds.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | uint256 The current epoch number. |




