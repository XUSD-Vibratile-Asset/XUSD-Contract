# ShaStorage



> ShaStorage



*A contract that allows saving, retrieving, and summing `vibes` for each `aura` and `kappa` combination,      using `EnumSet` for efficiently iterating over `kappa` values per `aura`.*

## Methods

### MotzkinPrime

```solidity
function MotzkinPrime() external view returns (uint64)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

### addToStorage

```solidity
function addToStorage(uint64 aura, uint64 kappa, int256 vibes) external nonpayable
```

Adds `vibes` into vibesStorage using two uint64 values (`aura` and `kappa`).



#### Parameters

| Name | Type | Description |
|---|---|---|
| aura | uint64 | The first key in the storage. |
| kappa | uint64 | The second key in the storage. |
| vibes | int256 | The integer value to store. |

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

### getFromStorage

```solidity
function getFromStorage(uint64 aura, uint64 kappa) external view returns (int256)
```

Retrieve `vibes` from storage using the two keys (`aura` and `kappa`).



#### Parameters

| Name | Type | Description |
|---|---|---|
| aura | uint64 | The first key. |
| kappa | uint64 | The second key. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | The stored `vibes` corresponding to the (`aura`, `kappa`) combination. |

### saveToStorage

```solidity
function saveToStorage(uint64 aura, uint64 kappa, int256 vibes) external nonpayable
```

Save `vibes` into vibesStorage using two uint64 values (`aura` and `kappa`).



#### Parameters

| Name | Type | Description |
|---|---|---|
| aura | uint64 | The first key in the storage. |
| kappa | uint64 | The second key in the storage. |
| vibes | int256 | The integer value to store. |

### sumVibesForAura

```solidity
function sumVibesForAura(uint64 aura, address user) external view returns (int256)
```

Sum the `vibes` for all values associated with a specific `aura`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| aura | uint64 | The `aura` key to sum vibes for. |
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | The total sum of `vibes` for the specified `aura`. |

### vibesStorage

```solidity
function vibesStorage(uint64, uint64) external view returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |
| _1 | uint64 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |




