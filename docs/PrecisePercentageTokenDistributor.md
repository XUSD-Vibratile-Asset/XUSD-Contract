# PrecisePercentageTokenDistributor



> PrecisePercentageTokenDistributor



*A contract that passively accepts ERC20 token transfers and distributes them to team members based on percentages out of 10,000 (for 4 decimal precision).*

## Methods

### PERCENTAGE_FACTOR

```solidity
function PERCENTAGE_FACTOR() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### addOrUpdateTeamMember

```solidity
function addOrUpdateTeamMember(address member, uint256 percentage) external nonpayable
```

Adds or updates a team member&#39;s percentage allocation.

*Only the contract owner can add or update team members.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| member | address | The address of the team member. |
| percentage | uint256 | The percentage of tokens this team member should receive (out of 10,000). |

### claimTokens

```solidity
function claimTokens() external nonpayable
```

Allows a team member to claim their allocated tokens based on the percentage.

*The claimant can only claim the tokens proportional to their percentage.*


### getTeamMembers

```solidity
function getTeamMembers() external view returns (address[])
```

Returns the list of team members.




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address[] | The array of team member addresses. |

### owner

```solidity
function owner() external view returns (address)
```



*Returns the address of the current owner.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### removeTeamMember

```solidity
function removeTeamMember(address member) external nonpayable
```

Removes a team member.

*Only the owner can remove team members.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| member | address | The address of the team member to remove. |

### renounceOwnership

```solidity
function renounceOwnership() external nonpayable
```



*Leaves the contract without owner. It will not be possible to call `onlyOwner` functions. Can only be called by the current owner. NOTE: Renouncing ownership will leave the contract without an owner, thereby disabling any functionality that is only available to the owner.*


### team

```solidity
function team(address) external view returns (uint256 percentage, uint256 claimed, bool isMember)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| percentage | uint256 | undefined |
| claimed | uint256 | undefined |
| isMember | bool | undefined |

### teamMembers

```solidity
function teamMembers(uint256) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### token

```solidity
function token() external view returns (contract IERC20)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract IERC20 | undefined |

### totalPercentage

```solidity
function totalPercentage() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### transferOwnership

```solidity
function transferOwnership(address newOwner) external nonpayable
```



*Transfers ownership of the contract to a new account (`newOwner`). Can only be called by the current owner.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| newOwner | address | undefined |



## Events

### OwnershipTransferred

```solidity
event OwnershipTransferred(address indexed previousOwner, address indexed newOwner)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| previousOwner `indexed` | address | undefined |
| newOwner `indexed` | address | undefined |

### TeamMemberAdded

```solidity
event TeamMemberAdded(address indexed member, uint256 percentage)
```



*Emitted when a team member is added or updated.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| member `indexed` | address | undefined |
| percentage  | uint256 | undefined |

### TeamMemberRemoved

```solidity
event TeamMemberRemoved(address indexed member)
```



*Emitted when a team member is removed.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| member `indexed` | address | undefined |

### TokensClaimed

```solidity
event TokensClaimed(address indexed claimant, uint256 amount)
```



*Emitted when a team member claims their tokens.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| claimant `indexed` | address | undefined |
| amount  | uint256 | undefined |



## Errors

### AddressEmptyCode

```solidity
error AddressEmptyCode(address target)
```



*There&#39;s no code at `target` (it is not a contract).*

#### Parameters

| Name | Type | Description |
|---|---|---|
| target | address | undefined |

### AddressInsufficientBalance

```solidity
error AddressInsufficientBalance(address account)
```



*The ETH balance of the account is not enough to perform the operation.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

### FailedInnerCall

```solidity
error FailedInnerCall()
```



*A call to an address target failed. The target may have reverted.*


### OwnableInvalidOwner

```solidity
error OwnableInvalidOwner(address owner)
```



*The owner is not a valid owner account. (eg. `address(0)`)*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |

### OwnableUnauthorizedAccount

```solidity
error OwnableUnauthorizedAccount(address account)
```



*The caller account is not authorized to perform an operation.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

### SafeERC20FailedOperation

```solidity
error SafeERC20FailedOperation(address token)
```



*An operation with an ERC20 token failed.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| token | address | undefined |


