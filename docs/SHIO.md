# SHIO









## Methods

### Cone

```solidity
function Cone() external view returns (contract SHA)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract SHA | undefined |

### Generate

```solidity
function Generate(uint64 Xi, uint64 Alpha, uint64 Beta) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Xi | uint64 | undefined |
| Alpha | uint64 | undefined |
| Beta | uint64 | undefined |

### Isolate

```solidity
function Isolate() external nonpayable
```






### Isomerize

```solidity
function Isomerize() external nonpayable
```






### Log

```solidity
function Log(uint64 Soul, uint64 Aura, string LogLine) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Soul | uint64 | undefined |
| Aura | uint64 | undefined |
| LogLine | string | undefined |

### Magnetize

```solidity
function Magnetize() external nonpayable returns (uint64)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

### Manifold

```solidity
function Manifold() external view returns (uint64)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

### Monopole

```solidity
function Monopole() external view returns (uint64)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

### MotzkinPrime

```solidity
function MotzkinPrime() external view returns (uint64)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

### React

```solidity
function React(uint64 Pi) external nonpayable returns (uint64, uint64)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Pi | uint64 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |
| _1 | uint64 | undefined |

### Rho

```solidity
function Rho() external view returns (contract SHA Rod, contract SHA Cone, uint64 Barn)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| Rod | contract SHA | undefined |
| Cone | contract SHA | undefined |
| Barn | uint64 | undefined |

### Rod

```solidity
function Rod() external view returns (contract SHA)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract SHA | undefined |

### Type

```solidity
function Type() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

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

### LogEvent

```solidity
event LogEvent(uint64 Soul, uint64 Aura, string LogLine)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Soul  | uint64 | undefined |
| Aura  | uint64 | undefined |
| LogLine  | string | undefined |

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

### BarnInequality

```solidity
error BarnInequality(uint64 Barn)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Barn | uint64 | undefined |

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

### ManifoldInequality

```solidity
error ManifoldInequality(uint64 Manifold)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Manifold | uint64 | undefined |

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

### ReactionInequalityError

```solidity
error ReactionInequalityError(uint64 Eta, uint64 Kappa)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Eta | uint64 | undefined |
| Kappa | uint64 | undefined |

### ReactionZeroError

```solidity
error ReactionZeroError(uint64 Eta, uint64 Kappa)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Eta | uint64 | undefined |
| Kappa | uint64 | undefined |

### RingInequality

```solidity
error RingInequality(uint64 Ring)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Ring | uint64 | undefined |


