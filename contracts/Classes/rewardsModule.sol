// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.26;

// import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// /**
//  * @title GenesisRewardsModule
//  * @dev This contract tracks user trading volumes in different Liquidity Pools (LPs) and distributes rewards based on their weight in each pool.
//  * Users' weights are calculated as their trading volume in an LP pool divided by the total trading volume in that pool during the epoch.
//  */
// contract GenesisRewardsModule is Ownable {
//     // Mapping to track users' trading volume in each LP per epoch
//     mapping(address => mapping(address => mapping(uint256 => uint256))) public userTradeVolume;  // user -> LP -> epoch -> volume
//     mapping(address => mapping(uint256 => uint256)) public totalLPVolume;  // LP -> epoch -> total volume

//     // Mapping to store rewards claimed by users
//     mapping(address => uint256) public userRewards;

//     // Tracking the current epoch and the reward balance for the current epoch
//     uint256 public currentEpoch;
//     uint256 public totalRewardPool;  // Total reward pool for the current epoch
//     uint256 public lastUpdateTime;

//     IERC20 public rewardToken;  // The token to be distributed as rewards

//     event VolumeTracked(address indexed user, address indexed lp, uint256 epoch, uint256 volume);
//     event RewardsDistributed(address indexed user, uint256 amount);

//     /**
//      * @dev Constructor to initialize the contract with the reward token address.
//      * @param _rewardToken The address of the ERC20 token used for rewards distribution.
//      */
//     constructor(address _rewardToken) {
//         rewardToken = IERC20(_rewardToken);
//         currentEpoch = 1;  // Start with epoch 1
//     }

//     /**
//      * @notice Tracks the user's trading volume in a specific LP during the current epoch.
//      * @dev This function should be called whenever a trade is executed in the LP.
//      * @param user The address of the user.
//      * @param lp The address of the Liquidity Pool (LP).
//      * @param volume The volume of the trade in the LP.
//      */
//     function trackTradeVolume(address user, address lp, uint256 volume) external onlyOwner {
//         require(volume > 0, "Volume must be greater than 0");

//         // Update user's trade volume and the total LP volume for the current epoch
//         userTradeVolume[user][lp][currentEpoch] += volume;
//         totalLPVolume[lp][currentEpoch] += volume;

//         emit VolumeTracked(user, lp, currentEpoch, volume);
//     }

//     /**
//      * @notice Calculates the user's weight in the specified LP for the current epoch.
//      * @param user The address of the user.
//      * @param lp The address of the Liquidity Pool (LP).
//      * @return The user's weight in the LP, represented as a percentage.
//      */
//     function calculateWeight(address user, address lp) public view returns (uint256) {
//         uint256 userVolume = userTradeVolume[user][lp][currentEpoch];
//         uint256 totalVolume = totalLPVolume[lp][currentEpoch];
        
//         // User's weight is their volume divided by the total LP volume, scaled to 1e18 for precision
//         if (totalVolume == 0) {
//             return 0;  // No trades in the LP, weight is 0
//         }
//         return (userVolume * 1e18) / totalVolume;
//     }

//     /**
//      * @notice Distributes rewards to a user based on their weight in all LPs for the current epoch.
//      * @param user The address of the user to distribute rewards to.
//      */
//     function distributeRewards(address user) external onlyOwner {
//         uint256 totalReward = 0;

//         // Iterate over all LPs the user participated in
//         address[] memory allLPs = getAllLPs();  // Assuming getAllLPs() gives the list of LP addresses
//         for (uint256 i = 0; i < allLPs.length; i++) {
//             address lp = allLPs[i];
//             uint256 userWeight = calculateWeight(user, lp);

//             // Calculate the user's reward from the total reward pool for the current epoch
//             uint256 rewardForLP = (userWeight * totalRewardPool) / 1e18;
//             totalReward += rewardForLP;
//         }

//         // Transfer the calculated reward to the user
//         require(totalReward > 0, "No rewards available for distribution.");
//         rewardToken.transfer(user, totalReward);
//         userRewards[user] += totalReward;

//         emit RewardsDistributed(user, totalReward);
//     }

//     /**
//      * @notice Sets a new reward pool for the current epoch. Can only be called by the owner.
//      * @dev This should be called at the start of a new epoch.
//      * @param rewardAmount The total reward amount allocated for the current epoch.
//      */
//     function setRewardPool(uint256 rewardAmount) external onlyOwner {
//         require(rewardAmount > 0, "Reward amount must be greater than 0");
//         totalRewardPool = rewardAmount;
//         lastUpdateTime = block.timestamp;
//     }

//     /**
//      * @notice Starts a new epoch by incrementing the epoch counter.
//      * @dev Any rewards for the previous epoch should be distributed before calling this function.
//      */
//     function startNewEpoch() external onlyOwner {
//         currentEpoch += 1;
//     }

 
// }
