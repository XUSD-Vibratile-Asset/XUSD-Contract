# MyGovernor



> MyGovernor



*A contract to manage proposal creation, voting, and checking votes for Vibe-based governance.  It integrates with the VibeRegistry and VibePass contracts for access control and voting.*

## Methods

### VoterTallyMap

```solidity
function VoterTallyMap(address) external view returns (address classAddress, uint256 voteTotal, uint256 index, uint256 timestampStart, uint256 totalNft, string name, string description, bool approved, bool rewards, bool process, uint256 classType)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |
| voteTotal | uint256 | undefined |
| index | uint256 | undefined |
| timestampStart | uint256 | undefined |
| totalNft | uint256 | undefined |
| name | string | undefined |
| description | string | undefined |
| approved | bool | undefined |
| rewards | bool | undefined |
| process | bool | undefined |
| classType | uint256 | undefined |

### checkVotes

```solidity
function checkVotes(address classAddress) external nonpayable
```

Check if a vote has passed and, if so, register the class in VibeRegistry.

*Only callable by a Senator.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress | address | The address of the class proposal being checked. |

### denominator

```solidity
function denominator() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### propose

```solidity
function propose(MyGovernor.VoteProposal proposal, address classAddress) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| proposal | MyGovernor.VoteProposal | undefined |
| classAddress | address | undefined |

### showActiveVibes

```solidity
function showActiveVibes(uint256 limit, uint256 offset) external view returns (struct MyGovernor.VoteTally[])
```

Retrieve a list of approved vibes.



#### Parameters

| Name | Type | Description |
|---|---|---|
| limit | uint256 | The number of vibes to return. |
| offset | uint256 | The starting index for pagination. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | MyGovernor.VoteTally[] | An array of VoteTally structs representing approved vibes. |

### showAllProposals

```solidity
function showAllProposals(uint256 limit, uint256 offset) external view returns (struct MyGovernor.VoteTally[])
```

Retrieve a list of unapproved proposals.



#### Parameters

| Name | Type | Description |
|---|---|---|
| limit | uint256 | The number of proposals to return. |
| offset | uint256 | The starting index for pagination. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | MyGovernor.VoteTally[] | An array of VoteTally structs representing unapproved proposals. |

### updateNft

```solidity
function updateNft(address _Nft) external nonpayable
```

Update the VibePass contract address.

*Only callable by a Senator.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _Nft | address | The new address for the VibePass contract. |

### updateVoteDen

```solidity
function updateVoteDen(uint256 _denominator) external nonpayable
```

Update the denominator for vote approval threshold.

*The new denominator must be between 1 and 10. Only callable by a Senator.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _denominator | uint256 | New denominator for vote tally checks. |

### viewNumberOfProposals

```solidity
function viewNumberOfProposals() external view returns (uint256)
```

Get the number of proposals currently in the registry.




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | The count of proposals. |

### vote

```solidity
function vote(address classAddress) external nonpayable
```

Cast a vote on a proposal.

*Requires the caller to hold a VibePass. The user can only vote once per proposal.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress | address | The address of the proposal class being voted on. |



## Events

### NftAddressUpdated

```solidity
event NftAddressUpdated(address oldNft, address newNft)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| oldNft  | address | undefined |
| newNft  | address | undefined |

### ProposalFailed

```solidity
event ProposalFailed(address indexed proposer, address indexed classAddress, string reason)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| proposer `indexed` | address | undefined |
| classAddress `indexed` | address | undefined |
| reason  | string | undefined |

### VoteCast

```solidity
event VoteCast(address indexed voter, address indexed classAddress, uint256 voteTotal)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| voter `indexed` | address | undefined |
| classAddress `indexed` | address | undefined |
| voteTotal  | uint256 | undefined |

### VoteChecked

```solidity
event VoteChecked(address indexed classAddress, bool approved, uint256 totalVotes)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress `indexed` | address | undefined |
| approved  | bool | undefined |
| totalVotes  | uint256 | undefined |

### VoteDenominatorUpdated

```solidity
event VoteDenominatorUpdated(uint256 oldDenominator, uint256 newDenominator)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| oldDenominator  | uint256 | undefined |
| newDenominator  | uint256 | undefined |

### VoteProposed

```solidity
event VoteProposed(address indexed proposer, address indexed classAddress, string name, string description, uint256 classType, bool process, bool rewards)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| proposer `indexed` | address | undefined |
| classAddress `indexed` | address | undefined |
| name  | string | undefined |
| description  | string | undefined |
| classType  | uint256 | undefined |
| process  | bool | undefined |
| rewards  | bool | undefined |



## Errors

### AlreadyPassed

```solidity
error AlreadyPassed(address classAddress)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |

### AlreadyProposed

```solidity
error AlreadyProposed(address classAddress)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |

### AlreadyVoted

```solidity
error AlreadyVoted(address voter, address classAddress)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| voter | address | undefined |
| classAddress | address | undefined |

### ClassAddressNotMatch

```solidity
error ClassAddressNotMatch(address provided, address expected)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| provided | address | undefined |
| expected | address | undefined |

### InvalidDenominator

```solidity
error InvalidDenominator(uint256 min, uint256 max)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| min | uint256 | undefined |
| max | uint256 | undefined |

### NeedAVibePass

```solidity
error NeedAVibePass()
```






### NotAllowedAccess

```solidity
error NotAllowedAccess()
```







