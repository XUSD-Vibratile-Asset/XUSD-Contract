# VibeRegistry



> VibeRegistry



*This contract manages user vibes, class structures, and reward distribution through multiple registries. Access control is handled via the inherited AccesorMod, providing restrictions on key operations.*

## Methods

### MotzkinPrime

```solidity
function MotzkinPrime() external view returns (uint64)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

### activateVibeUser

```solidity
function activateVibeUser(address user, address class) external nonpayable
```

Reactivates a user&#39;s vibe entry for a specific class.

*Can only be called by the Consul.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user. |
| class | address | The address of the class. |

### addClass

```solidity
function addClass(address class, uint256 classType, bool _process) external nonpayable
```

Adds a new class to the specified registry.

*Can only be called by a Senator.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| class | address | The address of the class to be added. |
| classType | uint256 | The type of class (0: To, 1: From, 2: Caller, 3: Sender, 4: Contract). |
| _process | bool | Whether the class requires processing. |

### calculateAndSumBasis

```solidity
function calculateAndSumBasis(address to, address from, address _caller, address sender, uint256 amount) external nonpayable returns (int256, uint256)
```

Calculates vibes for multiple addresses, sums them, and applies to the caller.



#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | The address of the recipient. |
| from | address | The address of the sender. |
| _caller | address | The address of the contract caller. |
| sender | address | The address of the transaction initiator. |
| amount | uint256 | The amount to process. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | The sum of calculated vibes and the original amount. |
| _1 | uint256 | undefined |

### deactivateVibe

```solidity
function deactivateVibe(address class, uint256 classType) external nonpayable
```

Deactivates and removes a class from the specified registry.

*Can only be called by the Consul.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| class | address | The address of the class to be removed. |
| classType | uint256 | The type of class (0: To, 1: From, 2: Caller, 3: Sender, 4: Contract). |

### deactivateVibeUser

```solidity
function deactivateVibeUser(address user, address class) external nonpayable
```

Deactivates a user&#39;s vibe entry for a specific class.

*Can only be called by the Consul.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user. |
| class | address | The address of the class. |

### setClassLimit

```solidity
function setClassLimit(uint256 limit) external nonpayable
```

Updates the class limit for registry sorting.

*Can only be called by the Consul.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| limit | uint256 | The new class limit. |

### setWhitelistedContract

```solidity
function setWhitelistedContract(address contractWhite) external nonpayable
```

Sets a contract as whitelisted for vibe calculations.

*Can only be called by a Senator.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| contractWhite | address | The address of the contract to whitelist. |

### viewVibes

```solidity
function viewVibes(address user) external view returns (int256)
```

View the current vibes of a specific user.



#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user whose vibes you want to query. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | The current vibes of the user. |

### xusd

```solidity
function xusd() external view returns (contract XUSD)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract XUSD | undefined |



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



## Errors

### NotAllowedAccess

```solidity
error NotAllowedAccess()
```






### UnauthorizedAccess

```solidity
error UnauthorizedAccess(enum AuthLib.Rank roleId, address addr)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| roleId | enum AuthLib.Rank | undefined |
| addr | address | undefined |


