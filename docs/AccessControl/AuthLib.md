# AuthLib



> AuthLib



*A library for managing role-based access control (RBAC) using ranks. Allows accounts to be granted or revoked roles, and checks for required ranks.*


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
event RoleRevoked(address indexed account, enum AuthLib.Rank role)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | undefined |
| role  | enum AuthLib.Rank | undefined |



## Errors

### AccessControlUnauthorizedAccount

```solidity
error AccessControlUnauthorizedAccount(address account, bytes32 neededRole)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| neededRole | bytes32 | undefined |


