# VibeBank



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
function calculateTotalBasisFee(address addy, uint256 amount) external nonpayable returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| addy | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### description

```solidity
function description() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### getDescription

```solidity
function getDescription() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### getLevel

```solidity
function getLevel() external view returns (enum VibeBase.Importance)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | enum VibeBase.Importance | undefined |

### id

```solidity
function id() external view returns (address creatorAddress, string info, enum VibeBase.Importance level)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| creatorAddress | address | undefined |
| info | string | undefined |
| level | enum VibeBase.Importance | undefined |

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

### setBaseImportance

```solidity
function setBaseImportance(enum VibeBase.Importance level) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| level | enum VibeBase.Importance | undefined |

### updateVibes

```solidity
function updateVibes(address user, int256 vibes) external nonpayable returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| vibes | int256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### userStart

```solidity
function userStart(address) external view returns (bool started)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| started | bool | undefined |

### userVibes

```solidity
function userVibes(address) external view returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |




