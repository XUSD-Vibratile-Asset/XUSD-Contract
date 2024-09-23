# LIBSTRINGS









## Methods

### CaseInsensitiveCompare

```solidity
function CaseInsensitiveCompare(bytes1 A, bytes1 B) external pure returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| A | bytes1 | undefined |
| B | bytes1 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### CheckAcronym

```solidity
function CheckAcronym(string _A, string _B) external pure returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _A | string | undefined |
| _B | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### CheckAcronym

```solidity
function CheckAcronym(bytes _acronym, string _Beta) external pure returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _acronym | bytes | undefined |
| _Beta | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### CheckPalindrome

```solidity
function CheckPalindrome(string S) external pure returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| S | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### CheckPalindrome

```solidity
function CheckPalindrome(bytes S) external pure returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| S | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### GetMarketRate

```solidity
function GetMarketRate(address _a) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _a | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### Hex

```solidity
function Hex(bytes32 value) external pure returns (string)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| value | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### Hex

```solidity
function Hex(uint256 value) external pure returns (string)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### Hex

```solidity
function Hex(bytes data) external pure returns (string)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| data | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### Hex

```solidity
function Hex(address account) external pure returns (string)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### Purchase

```solidity
function Purchase(address _t, uint256 _a) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _t | address | undefined |
| _a | uint256 | undefined |

### RandomAcronym

```solidity
function RandomAcronym(uint8 MaxLength) external nonpayable returns (bytes Acronym)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| MaxLength | uint8 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| Acronym | bytes | undefined |

### Redeem

```solidity
function Redeem(address _t, uint256 _a) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _t | address | undefined |
| _a | uint256 | undefined |

### Rename

```solidity
function Rename(string newName, string newSymbol) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newName | string | undefined |
| newSymbol | string | undefined |

### Reverse

```solidity
function Reverse(bytes S) external pure returns (bytes Reversed)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| S | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| Reversed | bytes | undefined |

### Reverse

```solidity
function Reverse(string S) external pure returns (string Reversed)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| S | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| Reversed | string | undefined |

### String

```solidity
function String(uint256 value) external pure returns (string buffer)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| buffer | string | undefined |

### Type

```solidity
function Type() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### addOwner

```solidity
function addOwner(address newOwner) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newOwner | address | undefined |

### allowance

```solidity
function allowance(address owner, address spender) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |
| spender | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### approve

```solidity
function approve(address spender, uint256 value) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### balanceOf

```solidity
function balanceOf(address account) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### decimals

```solidity
function decimals() external view returns (uint8)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint8 | undefined |

### has

```solidity
function has(address _contract, string what) external view returns (bool does)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _contract | address | undefined |
| what | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| does | bool | undefined |

### log10

```solidity
function log10(uint256 value) external pure returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### mintToCap

```solidity
function mintToCap() external nonpayable
```






### name

```solidity
function name() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### renounceOwnership

```solidity
function renounceOwnership(address toRemove) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| toRemove | address | undefined |

### symbol

```solidity
function symbol() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### totalSupply

```solidity
function totalSupply() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### transfer

```solidity
function transfer(address to, uint256 value) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### transferFrom

```solidity
function transferFrom(address from, address to, uint256 value) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |




