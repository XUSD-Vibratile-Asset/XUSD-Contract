# VibeRegistry



> VibeRegistry



*This contract manages user vibes, class structures, and reward distribution through multiple registries. Access control is handled via the inherited AccesorMod, providing restrictions on key operations.*

## Methods

### Cat

```solidity
function Cat() external view returns (contract SHIO)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract SHIO | undefined |

### MotzkinPrime

```solidity
function MotzkinPrime() external view returns (uint64)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

### addClass

```solidity
function addClass(address class, uint256 classType) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| class | address | undefined |
| classType | uint256 | undefined |

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

### generateAura

```solidity
function generateAura(address user) external pure returns (uint64)
```



*Generates a unique aura based on the user&#39;s address.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | A unique aura value. |

### getAllVibes

```solidity
function getAllVibes() external view returns (address[])
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address[] | undefined |

### getAllVibesOne

```solidity
function getAllVibesOne() external view returns (address[])
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address[] | undefined |

### getAllVibesRewards

```solidity
function getAllVibesRewards() external view returns (address[])
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address[] | undefined |

### getAllVibesSecond

```solidity
function getAllVibesSecond() external view returns (address[])
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address[] | undefined |

### lastProcessedBlock

```solidity
function lastProcessedBlock() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

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


