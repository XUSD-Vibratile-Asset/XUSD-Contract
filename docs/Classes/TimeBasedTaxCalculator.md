# TimeBasedTaxCalculator



> TimeBasedTaxCalculator



*A tax calculator that imposes different tax rates based on the time of day.*

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
function calculateTotalBasisFee(address addy, uint256 amount) external view returns (int256)
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

### offPeakRateBasisPoints

```solidity
function offPeakRateBasisPoints() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### peakEndHour

```solidity
function peakEndHour() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### peakRateBasisPoints

```solidity
function peakRateBasisPoints() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### peakStartHour

```solidity
function peakStartHour() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### setBaseImportance

```solidity
function setBaseImportance(enum VibeBase.Importance level) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| level | enum VibeBase.Importance | undefined |




