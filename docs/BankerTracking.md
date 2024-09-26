# BankerTracking



> RewardDistributor

Distributes rewards to users based on liquidity provision and trading volume. Manages rewards using an epoch system and ensures users do not exceed defined limits.



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

### addLp

```solidity
function addLp(address lp) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| lp | address | undefined |

### calculateRewards

```solidity
function calculateRewards(address _to, address _from, address caller, address sender, uint256 _amount, int256 vibes) external nonpayable
```

Calculates and distributes rewards based on trading activity.



#### Parameters

| Name | Type | Description |
|---|---|---|
| _to | address | Address of the recipient |
| _from | address | Address of the sender |
| caller | address | Address of the caller |
| sender | address | Address that signed the transaction |
| _amount | uint256 | Amount of tokens |
| vibes | int256 | Vibe score of the user |

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

### setBaseImportance

```solidity
function setBaseImportance(enum VibeBase.Importance level) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| level | enum VibeBase.Importance | undefined |

### userVibes

```solidity
function userVibes(uint256) external view returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |




