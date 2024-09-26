# SurfRouterV1









## Methods

### WETHBalance

```solidity
function WETHBalance() external view returns (uint256 balance)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| balance | uint256 | undefined |

### owner

```solidity
function owner() external view returns (address)
```



*Returns the address of the current owner.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### recoverETH

```solidity
function recoverETH() external nonpayable
```






### recoverTokens

```solidity
function recoverTokens(address _token) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _token | address | undefined |

### renounceOwnership

```solidity
function renounceOwnership() external nonpayable
```



*Leaves the contract without owner. It will not be possible to call `onlyOwner` functions anymore. Can only be called by the current owner. NOTE: Renouncing ownership will leave the contract without an owner, thereby removing any functionality that is only available to the owner.*


### swapV2

```solidity
function swapV2(address _router, address[] path, uint256 amountIn, uint256 slipage, address to) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _router | address | undefined |
| path | address[] | undefined |
| amountIn | uint256 | undefined |
| slipage | uint256 | undefined |
| to | address | undefined |

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



