# AccessManager



> AccessManager



*A contract for managing role-based access control. Allows accounts to be granted or revoked roles, and checks for required ranks. This contract uses the AuthLib library for role management.*

## Methods

### checkRole

```solidity
function checkRole(address account, enum AuthLib.Rank rank) external view returns (bool)
```

Checks if an account has a specific role or higher.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | The address of the account to check. |
| rank | enum AuthLib.Rank | The required rank to check against. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | True if the account holds the required rank or higher, false otherwise. |

### getAccountRank

```solidity
function getAccountRank(address account) external view returns (enum AuthLib.Rank)
```

Returns the highest rank (role) assigned to an account.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | The address of the account to query. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | enum AuthLib.Rank | The rank held by the account. |

### grantRole

```solidity
function grantRole(address account, enum AuthLib.Rank rank) external nonpayable
```

Grants a specific role to an account.

*Only accounts with the CONSUL or higher role can grant roles.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | The address of the account to grant the role to. |
| rank | enum AuthLib.Rank | The rank (role) to assign to the account. |

### revokeRole

```solidity
function revokeRole(address account) external nonpayable
```

Revokes a role from a specific account.

*Only accounts with the CONSUL or higher role can revoke roles.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | The address of the account to revoke the role from. |



## Events

### RoleGranted

```solidity
event RoleGranted(address indexed account, enum AuthLib.Rank role)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | undefined |
| role  | enum AuthLib.Rank | undefined |

### RoleRevoked

```solidity
event RoleRevoked(address indexed account)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | undefined |



