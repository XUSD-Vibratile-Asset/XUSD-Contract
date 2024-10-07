// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "../math/atropamath.sol";
import '../VibeRegistry.sol';
import "../AddressReg.sol";
import "hardhat/console.sol";
import "./IShaStorage.sol";
import '../interface/IERC20.sol';
import "../AccessControl/AccessorMod.sol";



interface ILPToken {
    function token0() external view returns (address);
    function token1() external view returns (address);
}
/**
 * @title LPVibeTracker
 * @dev A contract that tracks and stores the LP token balance of users as a "vibe".
 * It also checks farming contracts for LP token deposits when a user's balance decreases.
 */
contract LPVibeTracker2 is AccesorMod  {
    uint64 public constant MotzkinPrime = 953467954114363;
    address public XUSD; // The address of the XUSD token
    mapping(address => bool) public lps; // LP tokens mapping
    mapping(uint => mapping(uint =>  uint256)) public lpBalances; // Store LP balances locally
    mapping(address => mapping(uint =>  uint256)) public lpBalancesAfter; // Store LP balances locally
    mapping(address => int) private lpVibes; // Store LP vibes locally
    IShaStorage storageUnit;
    address[] public lpIndex;
    uint public length;

    // Farming contracts that users might deposit their LP tokens into
    address[] public farmContracts;

    constructor(address access)  AccesorMod(access) {
         
            lpIndex.push(0x804494bf520640Ff04E31263e776422d1A846882);
            lpIndex.push(0x79fC0e8d904F7145d7eD2F1E74B96c806e9BF249);
            farmContracts.push(0xa5255A4E00d4e2762EA7e9e1Dc4Ecf68b981e760);
            length = 2;
    }

    /**
     * @dev Adds an LP token address to the whitelist.
     * @param _token The LP token address to add.
     */
    function addLp(address _token) external onlyConsul {
        require(_token != address(0), "Invalid LP token address");
        lps[_token] = true;
        lpIndex.push(_token);
    }

    /**
     * @dev Adds a farm contract where users might deposit their LP tokens.
     * @param farm The address of the farming contract.
     */
    function addFarmContract(address farm) external onlyConsul {
        require(farm != address(0), "Invalid farm address");

        farmContracts.push(farm);
    }


    function changePidLengths(uint _length) external onlyConsul {
        length = _length;
    
    }

    /**
     * @dev Sets the XUSD token address.
     * @param xusd The new XUSD token address.
     */
    function setToken(address xusd) external onlyConsul {
        require(xusd != address(0), "Invalid XUSD address");
        XUSD = xusd;
    }
    function generateAura(address user) public pure returns (uint64) {
        return uint64(uint256(uint160(user))) % MotzkinPrime;
    }

     function process(
        address userAddress
    ) external   returns(int) {
       
     console.log("MOODdddddd");
        for (uint j; j < lpIndex.length; ){
        lpBalancesAfter[userAddress][generateAura(lpIndex[j])] = IERC20(lpIndex[j]).balanceOf(userAddress);
    
            unchecked{
                j++;
            }
        }

      return 0;



    
    }

    /**
 * @notice Returns all LP token balances for a specific user, including balances from farms.
 * @dev This function aggregates the user's LP token balances across different registered LP tokens and farm contracts.
 * @param user The address of the user to retrieve balances for.
 * @return uint256[] An array of LP token balances corresponding to each registered LP token.
 */
function getAllLpBalances(address user) external view returns (uint256[] memory) {
    uint256[] memory balances = new uint256[](lpIndex.length + length);
    uint64 userAura = generateAura(user);

    // Get balances from local LP tokens
    for (uint256 i = 0; i < length; i++) {
        balances[i] = lpBalances[userAura][i];
    }

    // Get balances from farm contracts
    uint256 farmBalanceIndex = length;
    for (uint256 i = 0; i < lpIndex.length; i++) {
    balances[farmBalanceIndex] = lpBalancesAfter[user][generateAura(lpIndex[i])];

        ++farmBalanceIndex;
    }

    return balances;
}

    /**
     * @dev Retrieves the LP vibe for a specific user.
     * @param user The address of the user.
     * @return int The user's LP "vibe" (their LP token balance).
     */
    function getLpVibe(address user) external view returns (int) {
        return lpVibes[user];
    }



 
   
}
