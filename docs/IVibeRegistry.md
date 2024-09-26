# IVibeRegistry









## Methods

### activateVibeUser

```solidity
function activateVibeUser(address user, address class) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| class | address | undefined |

### addClass

```solidity
function addClass(address class, uint256 classType, bool process) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| class | address | undefined |
| classType | uint256 | undefined |
| process | bool | undefined |

### calculateAndSumBasis

```solidity
function calculateAndSumBasis(address to, address from, address _caller, address sender, uint256 amount) external nonpayable returns (int256, uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| from | address | undefined |
| _caller | address | undefined |
| sender | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |
| _1 | uint256 | undefined |

### calculateCurrentVibe

```solidity
function calculateCurrentVibe(address user) external view returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### deactivateVibe

```solidity
function deactivateVibe(address class, uint256 classType) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| class | address | undefined |
| classType | uint256 | undefined |

### deactivateVibeUser

```solidity
function deactivateVibeUser(address user, address class) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| class | address | undefined |

### logMasterClassError

```solidity
function logMasterClassError(address class, uint256 Omnicron) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| class | address | undefined |
| Omnicron | uint256 | undefined |

### setClassLimit

```solidity
function setClassLimit(uint256 limit) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| limit | uint256 | undefined |

### setWhitelistedContract

```solidity
function setWhitelistedContract(address contractWhite) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| contractWhite | address | undefined |

### viewVibes

```solidity
function viewVibes(address user) external view returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |



## Events

### ClassAdded

```solidity
event ClassAdded(address indexed classAddress, uint256 classType)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress `indexed` | address | undefined |
| classType  | uint256 | undefined |

### ClassDeactivated

```solidity
event ClassDeactivated(address indexed classAddress, uint256 classType)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress `indexed` | address | undefined |
| classType  | uint256 | undefined |

### ClassLimitUpdated

```solidity
event ClassLimitUpdated(uint256 newLimit)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newLimit  | uint256 | undefined |

### ClassRemoved

```solidity
event ClassRemoved(address indexed classAddress, uint256 classType)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress `indexed` | address | undefined |
| classType  | uint256 | undefined |

### MasterClassErrorLogged

```solidity
event MasterClassErrorLogged(address indexed classAddress, uint256 Omnicron)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress `indexed` | address | undefined |
| Omnicron  | uint256 | undefined |

### MasterClassVibesUpdated

```solidity
event MasterClassVibesUpdated(address indexed classAddress, int256 vibes)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress `indexed` | address | undefined |
| vibes  | int256 | undefined |

### RewardsCalculated

```solidity
event RewardsCalculated(address indexed classAddress, bytes reason)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress `indexed` | address | undefined |
| reason  | bytes | undefined |

### RewardsCalculationFailed

```solidity
event RewardsCalculationFailed(address indexed classHash, bytes reason)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classHash `indexed` | address | undefined |
| reason  | bytes | undefined |

### VibeUserActivated

```solidity
event VibeUserActivated(address indexed user, address classAddress)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| classAddress  | address | undefined |

### VibeUserDeactivated

```solidity
event VibeUserDeactivated(address indexed user, address classAddress)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| classAddress  | address | undefined |

### VibesCalculated

```solidity
event VibesCalculated(address indexed user, int256 vibes)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| vibes  | int256 | undefined |

### WhitelistedContractAdded

```solidity
event WhitelistedContractAdded(address indexed contractAddress)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| contractAddress `indexed` | address | undefined |



