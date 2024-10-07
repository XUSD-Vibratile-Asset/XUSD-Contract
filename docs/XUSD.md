# XUSD









## Methods

### Rewardtransfer

```solidity
function Rewardtransfer(address to, uint256 amount) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| amount | uint256 | undefined |

### allowance

```solidity
function allowance(address _owner, address spender) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _owner | address | undefined |
| spender | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### approve

```solidity
function approve(address spender, uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### balanceOf

```solidity
function balanceOf(address account) external view returns (uint256)
```



*Returns the value of tokens owned by `account`.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### burnAddress

```solidity
function burnAddress() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### burnBalanceContract

```solidity
function burnBalanceContract(address contractAddr) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| contractAddr | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### burnBalanceEOA

```solidity
function burnBalanceEOA(address user) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### decimals

```solidity
function decimals() external view returns (uint8)
```



*Returns the decimals places of the token.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint8 | undefined |

### decreaseAllowance

```solidity
function decreaseAllowance(address spender, uint256 subtractedValue) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| subtractedValue | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### getFullBurnHistoryContract

```solidity
function getFullBurnHistoryContract(address contractAddr) external view returns (uint32[] blocks, uint224[] burns)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| contractAddr | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| blocks | uint32[] | undefined |
| burns | uint224[] | undefined |

### getFullBurnHistoryEOA

```solidity
function getFullBurnHistoryEOA(address user) external view returns (uint32[] blocks, uint224[] burns)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| blocks | uint32[] | undefined |
| burns | uint224[] | undefined |

### getLatestBurnContract

```solidity
function getLatestBurnContract(address contractAddr) external view returns (uint224)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| contractAddr | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint224 | undefined |

### getLatestBurnEOA

```solidity
function getLatestBurnEOA(address user) external view returns (uint224)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint224 | undefined |

### increaseAllowance

```solidity
function increaseAllowance(address spender, uint256 addedValue) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| addedValue | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### isExcludedFromTax

```solidity
function isExcludedFromTax(address account) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### mint

```solidity
function mint(address to, uint256 amount) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| amount | uint256 | undefined |

### name

```solidity
function name() external view returns (string)
```



*Returns the name of the token.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### registry

```solidity
function registry() external view returns (contract VibeRegistry)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract VibeRegistry | undefined |

### setExclusionFromTax

```solidity
function setExclusionFromTax(address account, bool status) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| status | bool | undefined |

### setRegistry

```solidity
function setRegistry(address reg) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| reg | address | undefined |

### setTaxVariable

```solidity
function setTaxVariable(uint256 treasury, uint256 burn) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| treasury | uint256 | undefined |
| burn | uint256 | undefined |

### setTreasury

```solidity
function setTreasury(address t) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| t | address | undefined |

### symbol

```solidity
function symbol() external view returns (string)
```



*Returns the symbol of the token.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### totalBurned

```solidity
function totalBurned() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### totalSupply

```solidity
function totalSupply() external view returns (uint256)
```



*Returns the value of tokens in existence.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### transfer

```solidity
function transfer(address to, uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### transferFrom

```solidity
function transferFrom(address from, address to, uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |



## Events

### Approval

```solidity
event Approval(address indexed owner, address indexed spender, uint256 value)
```



*Emitted when the allowance of a `spender` for an `owner` is set by a call to {approve}. `value` is the new allowance.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner `indexed` | address | undefined |
| spender `indexed` | address | undefined |
| value  | uint256 | undefined |

### Transfer

```solidity
event Transfer(address indexed from, address indexed to, uint256 value)
```



*Emitted when `value` tokens are moved from one account (`from`) to another (`to`). Note that `value` may be zero.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| from `indexed` | address | undefined |
| to `indexed` | address | undefined |
| value  | uint256 | undefined |



## Errors

### CheckpointUnorderedInsertion

```solidity
error CheckpointUnorderedInsertion()
```



*A value was attempted to be inserted on a past checkpoint.*



