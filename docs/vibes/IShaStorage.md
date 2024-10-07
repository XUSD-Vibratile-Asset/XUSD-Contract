# IShaStorage



> IShaStorage



*Interface for the ShaStorage contract that defines functions for saving, retrieving, summing vibes, etc.*

## Methods

### addToStorage

```solidity
function addToStorage(uint64 aura, uint64 kappa, int256 vibes) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| aura | uint64 | undefined |
| kappa | uint64 | undefined |
| vibes | int256 | undefined |

### getFromStorage

```solidity
function getFromStorage(uint64 aura, uint64 kappa) external view returns (int256)
```

Remove the storage entry for a specific (`aura`, `kappa`) combination.



#### Parameters

| Name | Type | Description |
|---|---|---|
| aura | uint64 | The first key. |
| kappa | uint64 | The second key. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | Whether the entry was removed (`true` if it existed and was removed, `false` otherwise). |

### processFirst

```solidity
function processFirst(address[] arrayAddresses) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| arrayAddresses | address[] | undefined |

### saveToStorage

```solidity
function saveToStorage(uint64 aura, uint64 kappa, int256 vibes) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| aura | uint64 | undefined |
| kappa | uint64 | undefined |
| vibes | int256 | undefined |

### sumVibesForAura

```solidity
function sumVibesForAura(uint64 aura, address user) external view returns (int256)
```

Sum the `vibes` for all `StorageUnit` objects associated with a specific `aura`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| aura | uint64 | The `aura` key to sum vibes for. |
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | The total sum of `vibes` for the specified `aura`. |




