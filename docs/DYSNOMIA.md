# DYSNOMIA









## Methods

### MotzkinPrime

```solidity
function MotzkinPrime() external view returns (uint64)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

### Rename

```solidity
function Rename(string newName, string newSymbol) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newName | string | undefined |
| newSymbol | string | undefined |

### Xiao

```solidity
function Xiao() external view returns (contract atropaMath)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract atropaMath | undefined |

### addOwner

```solidity
function addOwner(address newOwner) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newOwner | address | undefined |

### maxSupply

```solidity
function maxSupply() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### owner

```solidity
function owner(address cOwner) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| cOwner | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### owner

```solidity
function owner() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### renounceOwnership

```solidity
function renounceOwnership(address toRemove) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| toRemove | address | undefined |



## Events

### Approval

```solidity
event Approval(address indexed owner, address indexed spender, uint256 value)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| owner `indexed` | address | undefined |
| spender `indexed` | address | undefined |
| value  | uint256 | undefined |

### OwnershipUpdate

```solidity
event OwnershipUpdate(address indexed newOwner, bool indexed state)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newOwner `indexed` | address | undefined |
| state `indexed` | bool | undefined |

### Transfer

```solidity
event Transfer(address indexed from, address indexed to, uint256 value)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| from `indexed` | address | undefined |
| to `indexed` | address | undefined |
| value  | uint256 | undefined |



## Errors

### DysnomiaInsufficientAllowance

```solidity
error DysnomiaInsufficientAllowance(address origin, address sender, address owner, address spender, address what, uint256 allowance, uint256 needed)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| origin | address | undefined |
| sender | address | undefined |
| owner | address | undefined |
| spender | address | undefined |
| what | address | undefined |
| allowance | uint256 | undefined |
| needed | uint256 | undefined |

### DysnomiaInsufficientBalance

```solidity
error DysnomiaInsufficientBalance(address origin, address sender, address from, address to, address what, uint256 balance, uint256 needed)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| origin | address | undefined |
| sender | address | undefined |
| from | address | undefined |
| to | address | undefined |
| what | address | undefined |
| balance | uint256 | undefined |
| needed | uint256 | undefined |

### OwnableInvalidOwner

```solidity
error OwnableInvalidOwner(address origin, address owner, address what)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| origin | address | undefined |
| owner | address | undefined |
| what | address | undefined |

### OwnableUnauthorizedAccount

```solidity
error OwnableUnauthorizedAccount(address origin, address account, address what)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| origin | address | undefined |
| account | address | undefined |
| what | address | undefined |


