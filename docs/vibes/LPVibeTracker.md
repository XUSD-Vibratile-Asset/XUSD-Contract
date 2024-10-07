# LPVibeTracker



> LPVibeTracker



*A contract that tracks and stores the LP token balance of users as a &quot;vibe&quot;. It also checks farming contracts for LP token deposits when a user&#39;s balance decreases.*

## Methods

### MotzkinPrime

```solidity
function MotzkinPrime() external view returns (uint64)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

### UserActiveList

```solidity
function UserActiveList(uint256) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### XUSD

```solidity
function XUSD() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### addLp

```solidity
function addLp(address _token) external nonpayable
```



*Adds an LP token address to the whitelist.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _token | address | The LP token address to add. |

### addLp2

```solidity
function addLp2(address _token, uint256 pid) external nonpayable
```



*Adds an LP token address to the whitelist.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _token | address | The LP token address to add. |
| pid | uint256 | undefined |

### calculateTotalBasisFee

```solidity
function calculateTotalBasisFee(uint64 userAura, Trade[] trades, contract SHIO Cat, contract SHIO Cow) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| userAura | uint64 | undefined |
| trades | Trade[] | undefined |
| Cat | contract SHIO | undefined |
| Cow | contract SHIO | undefined |

### changeLimit

```solidity
function changeLimit(int256 _limit) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _limit | int256 | undefined |

### changePidLengths

```solidity
function changePidLengths(uint256 _length) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _length | uint256 | undefined |

### description

```solidity
function description() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### farmContracts

```solidity
function farmContracts() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### generateAura

```solidity
function generateAura(address user) external pure returns (uint64)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

### getDescription

```solidity
function getDescription() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### id

```solidity
function id() external view returns (address creatorAddress, string info)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| creatorAddress | address | undefined |
| info | string | undefined |

### lastLPBalances

```solidity
function lastLPBalances(address, address) external view returns (bool checked, uint256 Balance)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| checked | bool | undefined |
| Balance | uint256 | undefined |

### length

```solidity
function length() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### limit

```solidity
function limit() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### lpBalances

```solidity
function lpBalances(uint256, uint256) external view returns (bool checked, uint256 Balance)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |
| _1 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| checked | bool | undefined |
| Balance | uint256 | undefined |

### lpBalancesAfter

```solidity
function lpBalancesAfter(uint64, uint256) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |
| _1 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### lpIndex

```solidity
function lpIndex(uint256) external view returns (uint64 _hash, address contractAddress)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _hash | uint64 | undefined |
| contractAddress | address | undefined |

### lpIndexFarm

```solidity
function lpIndexFarm(uint256) external view returns (uint64 _hash, address contractAddress, uint256 pid)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _hash | uint64 | undefined |
| contractAddress | address | undefined |
| pid | uint256 | undefined |

### lps

```solidity
function lps(address) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### setToken

```solidity
function setToken(address xusd) external nonpayable
```



*Sets the XUSD token address.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| xusd | address | The new XUSD token address. |

### signedPercentage

```solidity
function signedPercentage(SD59x18 x) external pure returns (SD59x18 result)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| x | SD59x18 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| result | SD59x18 | undefined |




## Errors

### PRBMath_MulDiv18_Overflow

```solidity
error PRBMath_MulDiv18_Overflow(uint256 x, uint256 y)
```

Thrown when the resultant value in {mulDiv18} overflows uint256.



#### Parameters

| Name | Type | Description |
|---|---|---|
| x | uint256 | undefined |
| y | uint256 | undefined |

### PRBMath_SD59x18_Mul_InputTooSmall

```solidity
error PRBMath_SD59x18_Mul_InputTooSmall()
```

Thrown when multiplying two numbers and one of the inputs is `MIN_SD59x18`.




### PRBMath_SD59x18_Mul_Overflow

```solidity
error PRBMath_SD59x18_Mul_Overflow(SD59x18 x, SD59x18 y)
```

Thrown when multiplying two numbers and the intermediary absolute result overflows SD59x18.



#### Parameters

| Name | Type | Description |
|---|---|---|
| x | SD59x18 | undefined |
| y | SD59x18 | undefined |


