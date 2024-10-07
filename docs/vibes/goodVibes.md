# goodVibes



> WhitelistedAddressTaxCalculator



*A tax calculator that imposes a tax unless both the sender and recipient are whitelisted.*

## Methods

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

### description

```solidity
function description() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### farm1In

```solidity
function farm1In(uint64) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### farm2In

```solidity
function farm2In(address) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

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

### taxRateBasisPoints

```solidity
function taxRateBasisPoints() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### users

```solidity
function users(uint64) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |




