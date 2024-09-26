# VibePass



> VibePass



*ERC721 token representing a VibePass, with additional features for handling access control, token burning, and more. The contract integrates with VibeRegistry for vibe-based logic and OneSwap for purchase transactions.*

## Methods

### UserUpdate

```solidity
function UserUpdate(address user) external nonpayable
```

Update a user&#39;s vote balance based on burn amount.



#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user to update. |

### _transferVibePass

```solidity
function _transferVibePass(address from, address to, uint256 tokenId) external nonpayable
```



*Internal function to transfer a VibePass from one user to another.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | The address of the current owner. |
| to | address | The address of the new owner. |
| tokenId | uint256 | The token ID to transfer. |

### approve

```solidity
function approve(address to, uint256 tokenId) external payable
```



*Gives permission to `to` to transfer `tokenId` token to another account. See {ERC721A-_approve}. Requirements: - The caller must own the token or be an approved operator.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| tokenId | uint256 | undefined |

### balanceOf

```solidity
function balanceOf(address owner) external view returns (uint256)
```



*Returns the number of tokens in `owner`&#39;s account.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getAllUsersInfo

```solidity
function getAllUsersInfo() external view returns (struct VibePass.Nft[])
```

Returns information about all users who own a VibePass, up to the user limit.




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | VibePass.Nft[] | An array of user addresses and an array of structs containing user info. |

### getApproved

```solidity
function getApproved(uint256 tokenId) external view returns (address)
```



*Returns the account approved for `tokenId` token. Requirements: - `tokenId` must exist.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| tokenId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### getBurnAmountsEoa

```solidity
function getBurnAmountsEoa(uint256 id) external view returns (uint256)
```

Get the original burn amount of the VibePass.



#### Parameters

| Name | Type | Description |
|---|---|---|
| id | uint256 | The token ID of the VibePass. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | The original burn amount. |

### getUserInfo

```solidity
function getUserInfo(address user) external view returns (struct VibePass.Nft)
```

Returns the VibePass information for a specific user.



#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user whose VibePass information you want to retrieve. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | VibePass.Nft | A struct containing the user&#39;s VibePass information. |

### getUsername

```solidity
function getUsername(address user) external view returns (string)
```

Get the username associated with a user&#39;s VibePass.



#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | The username of the user&#39;s VibePass. |

### isApprovedForAll

```solidity
function isApprovedForAll(address owner, address operator) external view returns (bool)
```



*Returns if the `operator` is allowed to manage all of the assets of `owner`. See {setApprovalForAll}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |
| operator | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### mintPass

```solidity
function mintPass() external nonpayable
```

Mint a new VibePass NFT for the caller if they meet the required rank.

*User can only hold one VibePass, and funds are transferred from OneSwap on minting.*


### name

```solidity
function name() external view returns (string)
```



*Returns the token collection name.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### ownerOf

```solidity
function ownerOf(uint256 tokenId) external view returns (address)
```



*Returns the owner of the `tokenId` token. Requirements: - `tokenId` must exist.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| tokenId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### purchaseAmount

```solidity
function purchaseAmount() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### safeTransferFrom

```solidity
function safeTransferFrom(address from, address to, uint256 tokenId) external payable
```



*See {IERC721-safeTransferFrom}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| tokenId | uint256 | undefined |

### safeTransferFrom

```solidity
function safeTransferFrom(address from, address to, uint256 tokenId, bytes data) external payable
```



*See {IERC721-safeTransferFrom}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| tokenId | uint256 | undefined |
| data | bytes | undefined |

### setApprovalForAll

```solidity
function setApprovalForAll(address operator, bool approved) external nonpayable
```



*Approve or remove `operator` as an operator for the caller. Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller. Requirements: - The `operator` cannot be the caller. Emits an {ApprovalForAll} event.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| operator | address | undefined |
| approved | bool | undefined |

### setGladiator

```solidity
function setGladiator(int256 vibes) external nonpayable
```

Set the gladiator rank required for VibePass minting.

*Only callable by the Consul.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| vibes | int256 | Minimum vibes required for gladiator rank. |

### setURI

```solidity
function setURI(address user, string Url) external nonpayable
```

Set the URI for a VibePass holder.

*Only callable by the Consul.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user whose URI is being updated. |
| Url | string | The new URI. |

### setUserLimit

```solidity
function setUserLimit(uint256 limit) external nonpayable
```

Set a limit on how many users can be returned.

*Only callable by the Consul.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| limit | uint256 | The new limit for how many users can be returned. |

### setUserName

```solidity
function setUserName(string userName) external nonpayable
```

Set the username for the caller&#39;s VibePass.



#### Parameters

| Name | Type | Description |
|---|---|---|
| userName | string | The new username. |

### setXusd

```solidity
function setXusd(address _xusd) external nonpayable
```

Set the address of the XUSD token.

*Only callable by the Consul.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _xusd | address | The new XUSD token address. |

### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId) external view returns (bool)
```



*Returns true if this contract implements the interface defined by `interfaceId`. See the corresponding [EIP section](https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified) to learn more about how these ids are created. This function call must use less than 30000 gas.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| interfaceId | bytes4 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### symbol

```solidity
function symbol() external view returns (string)
```



*Returns the token collection symbol.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### tokenURI

```solidity
function tokenURI(uint256 tokenId) external view returns (string)
```



*Returns the Uniform Resource Identifier (URI) for `tokenId` token.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| tokenId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### totalSupply

```solidity
function totalSupply() external view returns (uint256)
```



*Returns the total number of tokens in existence. Burned tokens will reduce the count. To get the total number of tokens minted, please see {_totalMinted}.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### transferFrom

```solidity
function transferFrom(address from, address to, uint256 tokenId) external payable
```



*See {IERC721-transferFrom}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| tokenId | uint256 | undefined |

### userLimit

```solidity
function userLimit() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### withdrawOneswap

```solidity
function withdrawOneswap() external nonpayable
```

Withdraw funds from OneSwap contract.

*Only callable by the Preatormaximus.*




## Events

### Approval

```solidity
event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId)
```



*Emitted when `owner` enables `approved` to manage the `tokenId` token.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner `indexed` | address | undefined |
| approved `indexed` | address | undefined |
| tokenId `indexed` | uint256 | undefined |

### ApprovalForAll

```solidity
event ApprovalForAll(address indexed owner, address indexed operator, bool approved)
```



*Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner `indexed` | address | undefined |
| operator `indexed` | address | undefined |
| approved  | bool | undefined |

### ConsecutiveTransfer

```solidity
event ConsecutiveTransfer(uint256 indexed fromTokenId, uint256 toTokenId, address indexed from, address indexed to)
```



*Emitted when tokens in `fromTokenId` to `toTokenId` (inclusive) is transferred from `from` to `to`, as defined in the [ERC2309](https://eips.ethereum.org/EIPS/eip-2309) standard. See {_mintERC2309} for more details.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| fromTokenId `indexed` | uint256 | undefined |
| toTokenId  | uint256 | undefined |
| from `indexed` | address | undefined |
| to `indexed` | address | undefined |

### GladiatorRankUpdated

```solidity
event GladiatorRankUpdated(int256 newRank)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newRank  | int256 | undefined |

### OneSwapFundsWithdrawn

```solidity
event OneSwapFundsWithdrawn(address indexed consul, uint256 amount)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| consul `indexed` | address | undefined |
| amount  | uint256 | undefined |

### PassMinted

```solidity
event PassMinted(address indexed user, uint256 tokenId, uint256 purchaseBurnAmount)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| tokenId  | uint256 | undefined |
| purchaseBurnAmount  | uint256 | undefined |

### PassTransferred

```solidity
event PassTransferred(address indexed from, address indexed to, uint256 tokenId)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| from `indexed` | address | undefined |
| to `indexed` | address | undefined |
| tokenId  | uint256 | undefined |

### Transfer

```solidity
event Transfer(address indexed from, address indexed to, uint256 indexed tokenId)
```



*Emitted when `tokenId` token is transferred from `from` to `to`.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| from `indexed` | address | undefined |
| to `indexed` | address | undefined |
| tokenId `indexed` | uint256 | undefined |

### URIUpdated

```solidity
event URIUpdated(address indexed user, string newURI)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| newURI  | string | undefined |

### UserGladiatorRankUpgrade

```solidity
event UserGladiatorRankUpgrade(address user)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user  | address | undefined |

### UserNameUpdated

```solidity
event UserNameUpdated(address indexed user, string newUserName)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| newUserName  | string | undefined |

### VotesUpdated

```solidity
event VotesUpdated(address indexed user, uint256 newVotes)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| newVotes  | uint256 | undefined |

### XusdAddressUpdated

```solidity
event XusdAddressUpdated(address indexed updater, address newXusd)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| updater `indexed` | address | undefined |
| newXusd  | address | undefined |



## Errors

### ApprovalCallerNotOwnerNorApproved

```solidity
error ApprovalCallerNotOwnerNorApproved()
```

The caller must own the token or be an approved operator.




### ApprovalQueryForNonexistentToken

```solidity
error ApprovalQueryForNonexistentToken()
```

The token does not exist.




### BalanceQueryForZeroAddress

```solidity
error BalanceQueryForZeroAddress()
```

Cannot query the balance for the zero address.




### MintERC2309QuantityExceedsLimit

```solidity
error MintERC2309QuantityExceedsLimit()
```

The `quantity` minted with ERC2309 exceeds the safety limit.




### MintToZeroAddress

```solidity
error MintToZeroAddress()
```

Cannot mint to the zero address.




### MintZeroQuantity

```solidity
error MintZeroQuantity()
```

The quantity of tokens minted must be more than zero.




### NotAllowedToTransfer

```solidity
error NotAllowedToTransfer()
```






### NotRankedForVibePass

```solidity
error NotRankedForVibePass()
```






### OwnerQueryForNonexistentToken

```solidity
error OwnerQueryForNonexistentToken()
```

The token does not exist.




### OwnershipNotInitializedForExtraData

```solidity
error OwnershipNotInitializedForExtraData()
```

The `extraData` cannot be set on an unintialized ownership slot.




### TransferCallerNotOwnerNorApproved

```solidity
error TransferCallerNotOwnerNorApproved()
```

The caller must own the token or be an approved operator.




### TransferFromIncorrectOwner

```solidity
error TransferFromIncorrectOwner()
```

The token must be owned by `from`.




### TransferToNonERC721ReceiverImplementer

```solidity
error TransferToNonERC721ReceiverImplementer()
```

Cannot safely transfer to a contract that does not implement the ERC721Receiver interface.




### TransferToZeroAddress

```solidity
error TransferToZeroAddress()
```

Cannot transfer to the zero address.




### URIQueryForNonexistentToken

```solidity
error URIQueryForNonexistentToken()
```

The token does not exist.




### VibePassAlreadyMinted

```solidity
error VibePassAlreadyMinted()
```






### VibePassCanOnlyHoldOne

```solidity
error VibePassCanOnlyHoldOne()
```






### VibePassNonExistent

```solidity
error VibePassNonExistent()
```







