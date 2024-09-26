# RewardDistributor



> RewardDistributor

Distributes rewards to users based on liquidity provision and trading volume. Manages rewards using an epoch system and ensures users do not exceed defined limits.



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

### addToWhiteList

```solidity
function addToWhiteList(address account, address router) external nonpayable
```

Adds a new LP to the whitelist by a regular user, limited to one submission.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | Address of the LP |
| router | address | Router address associated with the LP |

### addToWhiteListAdmin

```solidity
function addToWhiteListAdmin(address account, address router) external nonpayable
```

Adds a new LP to the whitelist by an admin.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | Address of the LP |
| router | address | Router address associated with the LP |

### buyMultiplier

```solidity
function buyMultiplier() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### calculateRewards

```solidity
function calculateRewards(address _to, address _from, address caller, address sender, uint256 _amount, int256 vibes) external nonpayable
```

Calculates and distributes rewards based on trading activity.



#### Parameters

| Name | Type | Description |
|---|---|---|
| _to | address | Address of the recipient |
| _from | address | Address of the sender |
| caller | address | Address of the caller |
| sender | address | Address that signed the transaction |
| _amount | uint256 | Amount of tokens |
| vibes | int256 | Vibe score of the user |

### calculateTotalBasisFee

```solidity
function calculateTotalBasisFee(address addy, uint256 amount) external nonpayable returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| addy | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### changeBuySellMultipliers

```solidity
function changeBuySellMultipliers(uint256 buy, uint256 sell) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| buy | uint256 | undefined |
| sell | uint256 | undefined |

### changeEpochLength

```solidity
function changeEpochLength(uint256 length) external nonpayable
```

Allows updating of epoch length.



#### Parameters

| Name | Type | Description |
|---|---|---|
| length | uint256 | New epoch length in seconds |

### dailyLpRewards

```solidity
function dailyLpRewards(address, uint256) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### dailyMax

```solidity
function dailyMax() external view returns (uint256)
```

Total token pool available for rewards




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### dailyMaxPerLp

```solidity
function dailyMaxPerLp() external view returns (uint256)
```

Maximum tokens distributed daily




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### dailyMaxPerUserLp

```solidity
function dailyMaxPerUserLp() external view returns (uint256)
```

Max tokens per LP per day




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### dailyRewards

```solidity
function dailyRewards(uint256) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### dailyUserTotalRewards

```solidity
function dailyUserTotalRewards(address, uint256, uint256) external view returns (uint256 vibes, uint256 totalRewards, uint256 hashKeyLp, address lpAddress, bool maxed, uint256 accumulatedVolume)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | uint256 | undefined |
| _2 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| vibes | uint256 | undefined |
| totalRewards | uint256 | undefined |
| hashKeyLp | uint256 | undefined |
| lpAddress | address | undefined |
| maxed | bool | undefined |
| accumulatedVolume | uint256 | undefined |

### dailyVolume

```solidity
function dailyVolume(address, uint256) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### depositRewards

```solidity
function depositRewards(uint256 amount) external nonpayable
```

Deposits XUSD rewards into the contract.



#### Parameters

| Name | Type | Description |
|---|---|---|
| amount | uint256 | Amount of XUSD tokens to deposit |

### description

```solidity
function description() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### divisor

```solidity
function divisor() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### epochDuration

```solidity
function epochDuration() external view returns (uint256)
```

The duration of each epoch in seconds. In this case, one day (86400 seconds).




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### epochStartTime

```solidity
function epochStartTime() external view returns (uint256)
```

The timestamp when the epoch system started.




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getCurrentEpoch

```solidity
function getCurrentEpoch() external view returns (uint256)
```

Returns the current epoch number based on the elapsed time.

*The epoch number increments by 1 every `epochDuration` seconds.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | uint256 The current epoch number. |

### getDatesArray

```solidity
function getDatesArray() external view returns (uint256[])
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256[] | undefined |

### getDescription

```solidity
function getDescription() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### getInverse

```solidity
function getInverse(uint256 i) external pure returns (uint256)
```

Gets the inverse of a given number.



#### Parameters

| Name | Type | Description |
|---|---|---|
| i | uint256 | Input number |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | uint256 Inverse result as `maxValue - i + 1` |

### getLevel

```solidity
function getLevel() external view returns (enum VibeBase.Importance)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | enum VibeBase.Importance | undefined |

### getUserBalance

```solidity
function getUserBalance(address user) external view returns (uint256)
```

Retrieves the total balance of rewards a user is entitled to across all epochs and whitelisted LPs.



#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user whose reward balance is being checked. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | totalValue The total unclaimed reward balance for the user. |

### getUserTradingDataRewards

```solidity
function getUserTradingDataRewards(address lpAddress, address user, uint256 epoch) external view returns (struct RewardDistributor.UserGains)
```

Retrieves the user&#39;s trading data and rewards for a specific epoch and LP.



#### Parameters

| Name | Type | Description |
|---|---|---|
| lpAddress | address | The address of the liquidity provider (LP) in question. |
| user | address | The address of the user whose trading data is being queried. |
| epoch | uint256 | The specific epoch for which the data is requested. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | RewardDistributor.UserGains | A `UserGains` struct containing the user&#39;s trading data and reward information for the given LP and epoch. |

### getWhitelistedLp

```solidity
function getWhitelistedLp() external view returns (struct RewardDistributor.WhitelistedLp[])
```

Returns the list of whitelisted LPs.




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | RewardDistributor.WhitelistedLp[] | WhitelistedLp[] Array of whitelisted LPs |

### globalEpoch

```solidity
function globalEpoch() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### hashKeyStorage

```solidity
function hashKeyStorage(address, address) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### id

```solidity
function id() external view returns (address creatorAddress, string info, enum VibeBase.Importance level)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| creatorAddress | address | undefined |
| info | string | undefined |
| level | enum VibeBase.Importance | undefined |

### lpList

```solidity
function lpList(address) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### maths

```solidity
function maths() external view returns (contract VMREQ)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract VMREQ | undefined |

### maxValue

```solidity
function maxValue() external view returns (uint256)
```

External math library




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### randomMultiplier

```solidity
function randomMultiplier() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### sellMultiplier

```solidity
function sellMultiplier() external view returns (uint256)
```

Address of XUSD token




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### setBaseImportance

```solidity
function setBaseImportance(enum VibeBase.Importance level) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| level | enum VibeBase.Importance | undefined |

### setVariablesNumbers

```solidity
function setVariablesNumbers(RewardDistributor.VariableSettings data) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| data | RewardDistributor.VariableSettings | undefined |

### submitted

```solidity
function submitted(address) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### swapMultiplier

```solidity
function swapMultiplier() external view returns (uint256)
```

Max tokens per user per LP per day




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### totalSupply

```solidity
function totalSupply() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### userHasWithdrawn

```solidity
function userHasWithdrawn(address, uint256) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### vibeLimit

```solidity
function vibeLimit() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### whitelistedLp

```solidity
function whitelistedLp(uint256) external view returns (address lpAddress, address router)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| lpAddress | address | undefined |
| router | address | undefined |

### whitelistedLpMap

```solidity
function whitelistedLpMap(address) external view returns (address lpAddress, address router)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| lpAddress | address | undefined |
| router | address | undefined |

### withdraw

```solidity
function withdraw() external nonpayable
```

Allows users to withdraw their rewards.




### xusd

```solidity
function xusd() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |



## Events

### DistributeTokens

```solidity
event DistributeTokens(address indexed user, uint256 amount)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| amount  | uint256 | undefined |

### LpAdded

```solidity
event LpAdded(address indexed lpAddress, address indexed router)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| lpAddress `indexed` | address | undefined |
| router `indexed` | address | undefined |

### MultiplierChange

```solidity
event MultiplierChange(uint256 maxForUser)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| maxForUser  | uint256 | undefined |

### RewardCalculated

```solidity
event RewardCalculated(address indexed user, uint256 amount, uint256 epoch, address indexed lpAddress)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| amount  | uint256 | undefined |
| epoch  | uint256 | undefined |
| lpAddress `indexed` | address | undefined |

### VariablesChanged

```solidity
event VariablesChanged(uint256 maxForLp, uint256 maxForTotal, uint256 maxForUser, uint256 multiplier, int256 vibeLimit, uint256 randomMultiplier, uint256 divisor)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| maxForLp  | uint256 | undefined |
| maxForTotal  | uint256 | undefined |
| maxForUser  | uint256 | undefined |
| multiplier  | uint256 | undefined |
| vibeLimit  | int256 | undefined |
| randomMultiplier  | uint256 | undefined |
| divisor  | uint256 | undefined |

### Withdrawn

```solidity
event Withdrawn(address indexed user, uint256 amount)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| amount  | uint256 | undefined |



