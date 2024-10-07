# DecreasingOnBuys



> DecreasingOnBuys



*A tax calculator that imposes a tax unless both the sender and recipient are whitelisted. It processes multiple trades and calculates taxes based on LP involvement. Now dynamically checks if a token is an LP token involving XUSD by querying token0 and token1.*

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

### XUSD

```solidity
function XUSD() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### addLp

```solidity
function addLp(address _token) external nonpayable
```



*Adds an LP token address to the whitelist.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _token | address | The LP token address to add. |

### calculateTotalBasisFee

```solidity
function calculateTotalBasisFee(uint64 userAura, Trade[] trades, contract SHIO Cat, contract SHIO Cow) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| userAura | uint64 | undefined |
| trades | Trade[] | undefined |
| Cat | contract SHIO | undefined |
| Cow | contract SHIO | undefined |

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

### id

```solidity
function id() external view returns (address creatorAddress, string info)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| creatorAddress | address | undefined |
| info | string | undefined |

### lastLPBalances

```solidity
function lastLPBalances(address, address) external view returns (bool checked, uint256 Balance)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| checked | bool | undefined |
| Balance | uint256 | undefined |

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

### setToken

```solidity
function setToken(address xusd) external nonpayable
```



*Sets the XUSD token address.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| xusd | address | The new XUSD token address. |




