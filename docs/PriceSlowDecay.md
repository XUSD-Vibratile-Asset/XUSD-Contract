# PriceSlowDecay









## Methods

### duration

```solidity
function duration() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getCurrentPrice

```solidity
function getCurrentPrice() external view returns (uint256)
```

Returns the current price based on the time elapsed.

*Implements a quadratic decay function: (1 - (elapsedTime / duration)^2).      The price decays smoothly from `initialPrice` to `minPrice` over `duration`.      Uses FixedPointMathLib for precise arithmetic operations.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | The current price of the asset based on the decay curve. |

### initialPrice

```solidity
function initialPrice() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### minPrice

```solidity
function minPrice() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### startTime

```solidity
function startTime() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |




