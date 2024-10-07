
pragma solidity ^0.8.26;


import "../SHIO.sol";
import "../Trade.sol";
      


interface IVibeCalculator{

    struct trading{
    address to;
    address from;
    uint amount;
    uint userAura;
    uint previousHash;
}
//function isRewards() external returns (bool);

function calculateTotalBasisFee(uint64 userAura,
    Trade[] memory trades,
    SHIO Cat,
    SHIO Cow) external;

}
interface IRewardsModule{
//function isRewards() external returns (bool);

function calculateRewards(address to, address from, address caller, address sender, uint amount, int vibes) external ; 

}

interface IRewardsMajor{
//function isRewards() external returns (bool);

function calculateRewards(address to, address from, address caller, address sender, uint amount, int vibes)external  returns (int);

}