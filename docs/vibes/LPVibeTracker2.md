# LPVibeTracker2



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

### XUSD

```solidity
function XUSD() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### addFarmContract

```solidity
function addFarmContract(address farm) external nonpayable
```



*Adds a farm contract where users might deposit their LP tokens.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| farm | address | The address of the farming contract. |

### addLp

```solidity
function addLp(address _token) external nonpayable
```



*Adds an LP token address to the whitelist.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _token | address | The LP token address to add. |

### changePidLengths

```solidity
function changePidLengths(uint256 _length) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _length | uint256 | undefined |

### farmContracts

```solidity
function farmContracts(uint256) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

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

### getAllLpBalances

```solidity
function getAllLpBalances(address user) external view returns (uint256[])
```

Returns all LP token balances for a specific user, including balances from farms.

*This function aggregates the user&#39;s LP token balances across different registered LP tokens and farm contracts.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user to retrieve balances for. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256[] | uint256[] An array of LP token balances corresponding to each registered LP token. |

### getLpVibe

```solidity
function getLpVibe(address user) external view returns (int256)
```



*Retrieves the LP vibe for a specific user.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | int The user&#39;s LP &quot;vibe&quot; (their LP token balance). |

### length

```solidity
function length() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### lpBalances

```solidity
function lpBalances(uint256, uint256) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |
| _1 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### lpBalancesAfter

```solidity
function lpBalancesAfter(address, uint256) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### lpIndex

```solidity
function lpIndex(uint256) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

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

### process

```solidity
function process(address userAddress) external nonpayable returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| userAddress | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### setToken

```solidity
function setToken(address xusd) external nonpayable
```



*Sets the XUSD token address.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| xusd | address | The new XUSD token address. |




