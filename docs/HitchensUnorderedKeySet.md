# HitchensUnorderedKeySet









## Methods

### count

```solidity
function count() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### exists

```solidity
function exists(bytes32 key) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| key | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### insert

```solidity
function insert(bytes32 key) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| key | bytes32 | undefined |

### keyAtIndex

```solidity
function keyAtIndex(uint256 index) external view returns (bytes32)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| index | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes32 | undefined |

### remove

```solidity
function remove(bytes32 key) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| key | bytes32 | undefined |



## Events

### LogUpdate

```solidity
event LogUpdate(address sender, string action, bytes32 key)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| sender  | address | undefined |
| action  | string | undefined |
| key  | bytes32 | undefined |



