# TradingRewards









## Methods

### Active

```solidity
function Active() external view returns (bool)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### ActiveTraders

```solidity
function ActiveTraders() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### ClaimReward

```solidity
function ClaimReward() external nonpayable
```






### GetTrader

```solidity
function GetTrader(uint64 Soul) external view returns (struct TradingRewards.TraderReward)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Soul | uint64 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | TradingRewards.TraderReward | undefined |

### GetUserSoul

```solidity
function GetUserSoul() external view returns (uint64)
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

### Prize

```solidity
function Prize() external view returns (uint16)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint16 | undefined |

### RecordTrade

```solidity
function RecordTrade(uint64 Soul) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Soul | uint64 | undefined |

### RoundNumber

```solidity
function RoundNumber() external view returns (uint64)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

### SetActivityThreshold

```solidity
function SetActivityThreshold(uint8 _threshold) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _threshold | uint8 | undefined |

### SetMinTraders

```solidity
function SetMinTraders(uint8 _minTraders) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _minTraders | uint8 | undefined |

### SetRoundMinutes

```solidity
function SetRoundMinutes(uint8 _minutes) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _minutes | uint8 | undefined |

### Waat

```solidity
function Waat() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### calculateRewards

```solidity
function calculateRewards(address _to, address _from, address caller, address sender, uint256 _amount, int256 vibes) external nonpayable
```

Calculates and distributes rewards based on trades and React logic.

*The function processes trades where either `_to` or `_from` is a whitelisted contract,      and distributes rewards if the vibes score is within the allowed range.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _to | address | undefined |
| _from | address | undefined |
| caller | address | undefined |
| sender | address | undefined |
| _amount | uint256 | undefined |
| vibes | int256 | undefined |

### currentDay

```solidity
function currentDay() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### dateArray

```solidity
function dateArray(uint256) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### dateIndex

```solidity
function dateIndex() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getCurrentCompletedPeriod

```solidity
function getCurrentCompletedPeriod() external view returns (uint256)
```

Helper function to get the current &quot;completed period&quot; or day.




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | uint256 The current period or day in the contract. |

### lpAddresses

```solidity
function lpAddresses(uint256) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### lpIndex

```solidity
function lpIndex() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### modExp

```solidity
function modExp(uint256 _b, uint256 _e, uint256 _m) external nonpayable returns (uint256 result)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _b | uint256 | undefined |
| _e | uint256 | undefined |
| _m | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| result | uint256 | undefined |

### modExp64

```solidity
function modExp64(uint64 _b, uint64 _e, uint64 _m) external nonpayable returns (uint64 result)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _b | uint64 | undefined |
| _e | uint64 | undefined |
| _m | uint64 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| result | uint64 | undefined |

### whitelist

```solidity
function whitelist(address) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### whitelistLP

```solidity
function whitelistLP(address lpAddress, address routerAddress) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| lpAddress | address | undefined |
| routerAddress | address | undefined |



## Events

### JoinedTrader

```solidity
event JoinedTrader(uint64 Soul, string Username)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Soul  | uint64 | undefined |
| Username  | string | undefined |

### LogEvent

```solidity
event LogEvent(uint256 Waat, uint64 Soul, uint64 Aura, string LogLine)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Waat  | uint256 | undefined |
| Soul  | uint64 | undefined |
| Aura  | uint64 | undefined |
| LogLine  | string | undefined |

### NewTrade

```solidity
event NewTrade(uint64 Soul, string Username, uint256 TradeTime)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Soul  | uint64 | undefined |
| Username  | string | undefined |
| TradeTime  | uint256 | undefined |

### RewardClaimed

```solidity
event RewardClaimed(uint64 Soul, string Username, uint256 RewardAmount)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Soul  | uint64 | undefined |
| Username  | string | undefined |
| RewardAmount  | uint256 | undefined |

### RoundEnded

```solidity
event RoundEnded(uint64 RoundNumber)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| RoundNumber  | uint64 | undefined |

### RoundStarted

```solidity
event RoundStarted(uint64 RoundNumber)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| RoundNumber  | uint64 | undefined |



## Errors

### NotPlaying

```solidity
error NotPlaying(uint64 Soul)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Soul | uint64 | undefined |


