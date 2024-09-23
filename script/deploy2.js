


const { AbiCoder } = require("ethers");
const { ethers } = require("hardhat");
const axios = require('axios');

async function deployRouter() {
  console.log("Starting deployment of Router...");

 let provider = new ethers.JsonRpcProvider(`https://rpc.pulsechain.com`);
   const signer = new ethers.Wallet(process.env.PK, provider);
  // const signer2 = new ethers.Wallet(process.env.PK1, provider);

// const toker = "0xc89d5330C672CFb8957B0120Ac3Ec0C2A7295a62"
// const toke = await ethers.getContractFactory(`XUSD`);

// const class29 = await ethers.getContractFactory(`Reward`);
// const exClass = await ethers.getContractFactory(`Exchange`);
// const acc = ethers.getContractFactory("HierarchicalAccessControl")
// const access =  (await acc).attach("0xE6A75ED9207436aBEC421ded4bBbB1B9156cAd95")
// const tokerc = toke.attach("0xc89d5330C672CFb8957B0120Ac3Ec0C2A7295a62")
// // const token = ethers.getContractAt("0xfc5b27244EB01d34E019f94cbC053DC8F91aE6Da")
//  const reward = class29.attach("0x571A9Fc6eb082249dE2Cd11b32D96868444B6000")
//   await access.assignRank(toker, 4);
//   console.log("Access rank assigned to XUSD.");
// const libe2 = await ethers.getContractFactory('LibRegistryAdd');
// const lib22C = await libe2.deploy();
// const exClass = await ethers.getContractFactory('WhitelistTransactionTracker', {
//   libraries: { LibRegistryAdd: await lib22C.getAddress() },
// });
// const exxclass = await exClass.deploy('0xdB117EE426EA72A4A16Bc1f6a791bA9B0e8B8387', "0x66bF18702FCd4975Acf978a135bD65ACf9147EfA", {
//   creatorAddress: signer.address,
//   info: "moo",
//   level: 0,
// });
// await exxclass.waitForDeployment();
//   let mooo = {
//     creatorAddress: signer.address,
//     info: "Peak Hour vibe applicator",
//     level: 0
//   }
//   const libe2 = await ethers.getContractFactory('LibRegistryAdd');
//   const lib22C = await libe2.deploy();
//   await lib22C.waitForDeployment();
// const classReg = await ethers.getContractFactory(`WhitelistTransactionTracker`, {
//   libraries: { LibRegistryAdd: await lib22C.getAddress(),
 
//    },
// });
// const exxclass = await classReg.deploy('0xdB117EE426EA72A4A16Bc1f6a791bA9B0e8B8387', '0x66bF18702FCd4975Acf978a135bD65ACf9147EfA', {
//   creatorAddress: signer.address,
//   info: "moo",
//   level: 0,
// });
// await exxclass.waitForDeployment();
// console.log(`Exchange deployed at: ${await exxclass.getAddress()}`);
// const lib2 = await ethers.getContractFactory('LibRegistry');
// const lib2C = await lib2.deploy();
// const AccessLib = await ethers.getContractFactory('AuthLib');
// const accessLib = await AccessLib.deploy({
//   maxFeePerGas: 1383944817052937
// });
// await accessLib.waitForDeployment(); // In ethers v6, `deployed()` is replaced with `waitForDeployment`
// console.log(`AuthLib deployed at: ${await accessLib.getAddress()}`);




//const lib2 = await ethers.getContractFactory('LibRegistry');
const lib3 = await ethers.getContractFactory('AtropaMath');
const libV = await ethers.getContractFactory('VibeLibRegistry');
const libe2 = await ethers.getContractFactory('LibRegistryAdd');
const toke = await ethers.getContractFactory('XUSD');



// const lib22C = await libe2.deploy();
// await lib22C.waitForDeployment();
// console.log(`LibRegistryAdd deployed at: ${await lib22C.getAddress()}`);


let m = {
   dailyMax: BigInt(3_000_000 * 1e18), // Max tokens that can be distributed daily
   dailyMaxPerLp: BigInt(500_000 * 1e18),
   dailyMaxPerUserLp:BigInt(10_000 * 1e18),
   swapMultiplier: 1000,
   vibeLimit: 450,
   randomMultiplier: 100,
   divisor: 1000,
}


const exClass = await ethers.getContractFactory('RewardDistributor', {
  libraries: { LibRegistryAdd: '0xf3998D1f791346151eD90FCA2D06E37466874AE3',
  
   },
 });
 const VMREQ = await ethers.getContractFactory('VMREQ');

 const vm = await VMREQ.deploy();
 await vm.waitForDeployment()

// console.log(await vm.getAddress())
 const exxclass =  exClass.deploy( '0x66bF18702FCd4975Acf978a135bD65ACf9147EfA', '0xdB117EE426EA72A4A16Bc1f6a791bA9B0e8B8387', await vm.getAddress(), {
  creatorAddress: signer.address,
  info: "moo",
  level: 0,
})

 //console.log(await exxclass.setVariablesNumbers(m))

// // const rewardDistributor = await RewardDistributor.deploy("50000000000", '0x66bF18702FCd4975Acf978a135bD65ACf9147EfA', '0xdB117EE426EA72A4A16Bc1f6a791bA9B0e8B8387', '0xEf606258566593836106674c0e0574694A4871d3');
// // await rewardDistributor.waitForDeployment();
// console.log(`Exchange deployed at: ${await exxclass.getAddress()}`);
// // console.log(await rewardDistributor.getAddress())

const accessManagerFactory = await ethers.getContractFactory('AccessManager', {
  libraries: {
    AuthLib: '0x614f80771063a18593c5bada879729E8ED98374A',
  },
});
 const accessManager =  accessManagerFactory.attach('0xdB117EE426EA72A4A16Bc1f6a791bA9B0e8B8387');

 await accessManager.grantRole(await exxclass.getAddress(), 4);

//await accessManager.grantRole(await rewardDistributor.getAddress(), 4);

//await exxclass.whitelistAddress('0xDAb2915b8940BD3B4Bc6BF5Ac80Fa4e558057321', "0x165C3410fC91EF562C50559f7d2289fEbed552d9");
// //   await access.assignRank("0x2Bc82B634B146aCaf02785d56A6c3B74DCb20343", 4);
  // console.log(await exxclass.getAddress());


// //  await tokerc.setRegistry("0x2Bc82B634B146aCaf02785d56A6c3B74DCb20343");
// // await tokerc.transfer(await reward.getAddress(), ethers.parseEther("100000"));
//  const exxclass =  await exClass.deploy(await access.getAddress(), toker, await reward.getAddress(), moo5o)
//  console.log(await exxclass.getAddress());
//  await reward.setExchangeContract(await exxclass.getAddress())

// let mooo = {
//   creatorAddress: signer.address,
//   info: "moo",
//   level: 1
// }
//  const exClassw = await ethers.getContractFactory(`RandomizedVibeCalculator`);
//  const vibes =  await exClassw.deploy(100, 1600,  mooo, await access.getAddress())
// console.log(await vibes.getAddress())
// //  await toker.transfer(await reward.getAddress(), ethers.parseEther("100000"));
// //   console.log(`GenesisRewardsModule deployed at: ${await reward.getAddress()}`);
// //  const exxclass =  await exClass.deploy(await access.getAddress(), toker, await reward.getAddress(), moo5o)
// //   await reward.setExchangeContract(await exxclass.getAddress())
// //   await exxclass.addToWhiteListAdmin(signer.address)
//   console.log("XUSD registry set.");
//   // await toker.transfer(signer2.address, ethers.parseEther("100"));
//   // await toker.transfer(signer2.address, ethers.parseEther("100"));
//   // await toker.transfer(signer2.address, ethers.parseEther("100"));
//   const NFT = await ethers.getContractFactory(`VibePass`, {
//     libraries: {
//       LibRegistry: await lib2C.getAddress(),
//     },
//   });

//   console.log("Deploying contracts and executing interactions...");
//   const c5 = await class3.deploy(ethers.parseEther("100"), ethers.parseEther("1"), 300);
//   console.log(`PriceSlowDecay deployed at: ${await c5.getAddress()}`);

//   const classReg = await ethers.getContractFactory(`RandomizedVibeCalculator`);
//   const lit = await NFT.deploy(
//     "0xEb14f3192A37ad2501F3BF6627C565e6799aD661", 
//     await access.getAddress(), 
//     toker, 
//     await c5.getAddress()
//   );
//   console.log(`VibePass deployed at: ${await lit.getAddress()}`);

//   let gov = await class53.deploy(await access.getAddress(), await lit.getAddress(), await token.getAddress());
//   console.log(`MyGovernor deployed at: ${await gov.getAddress()}`);



// let mooo = {
//   creatorAddress: signer.address,
//   info: "moo",
//   level: 1
// }

// let mooo2 = {
//   creatorAddress: signer.address,
//   info: "moo",
//   level: 0
// }

//  const c6 = await classReg.deploy(500, 2000, mooo, await access.getAddress());
//  const c62 = await classReg.deploy(500, 2000, mooo2, await access.getAddress());
//  const c362 = await classReg.deploy(500, 2000, mooo2, await access.getAddress());
// //  const c762 = await classReg.deploy(500, 2000, mooo2, await access.getAddress());
// //  const c682 = await classReg.deploy(500, 2000, mooo2, await access.getAddress());
//   console.log(`RandomizedTaxCalculator deployed at: ${await c6.getAddress()}`);

//   console.log("Adding classes to XUSD...");
//   await token.addClass(await c6.getAddress(),  1, false);
//  // await token.addClass(await c62.getAddress(),  1, false);
//   // await token.addClass(await c362.getAddress(), true, 2, false);
//   // console.log("Transferring XUSD...");
//   await toker.transfer(signer2.address, ethers.parseEther("100"));
//   console.log("Transfer successful.");
//   const tokenOne = new ethers.Contract(
//     "0xEb14f3192A37ad2501F3BF6627C565e6799aD661",
//     require("./erc20abi.json"),
//     signer
//   );
//   await tokenOne.approve(await lit.getAddress(), "99999999999999999999999999999999999999999999999")
//   console.log("Assigning rank to rewarder...");
//  // await access.assignRank(await rewarder.getAddress(), 4);
//   await access.assignRank(await gov.getAddress(), 4);

//   await toker.approve(await reward.getAddress(), ethers.parseEther("100000"));
//   console.log("XUSD approved for rewards module.");
 
//   console.log(`Allowance: ${await toker.allowance(signer.address, await token.getAddress())}`);
//   //await reward.depositRewards(ethers.parseEther("100000"));
//   console.log("Rewards deposited.");

//   await token.addClass(await exxclass.getAddress(), 4, true);
//   console.log("Rewards module added to XUSD class.");
//   try {
//     console.log("Attempting to mint pass...");
//    // await lit.mintPass();
//     console.log("Pass minted successfully.");
   
//     console.log(ethers.formatEther(await exxclass.getTraderReward(signer.address)))
//     await exxclass.claimReward()
//     // If you uncomment and use ggg.mintPass(), ensure ggg is correctly instantiated
//     // await ggg.mintPass();
//   } catch (e) {
//     console.error("Error during minting:", e);
//   }
//   //  rewarder.addToWhiteListBig
//   // Define the proposal object
//   // let t = {
//   //   classAddress: await c682.getAddress(),
//   //   description: "DICK",
//   //   name: "Hi",        
//   //   process: false,
//   //   rewards: false,
//   //   classType: 1,
//   //   importance: 0,
//   // };

//     // Log initial balances
//     //const initialSignerBalance = await logBalanceDifference(signer.address, toker, "Initial signer");
//    // const initialSigner2Balance = await logBalanceDifference(signer2.address, toker, "Initial signer2");
  
//   //   console.log("Proposing new governance action...");
//   //  await gov.propose(t, await c682.getAddress());
//   //   console.log("Governance proposal created successfully.");
//     console.log("Transferring XUSD...");
//   await toker.transfer(signer.address, ethers.parseEther("100"));
//   console.log("Transfer successful.");

// //     console.log("Voting on proposal...");
// //     await gov.vote(await c682.getAddress());
// //     console.log("Vote cast successfully.");
  
// // //    Log balances after operations
// //     const finalSignerBalance = await logBalanceDifference(signer.address, toker, "Final signer");
// //     const finalSigner2Balance = await logBalanceDifference(signer2.address, toker, "Final signer2");
  
//     // Calculate and log the differences
//     // const signerDifference = finalSignerBalance.sub(initialSignerBalance);
//     // const signer2Difference = finalSigner2Balance.sub(initialSigner2Balance);
  
//     // console.log(`Signer balance change: ${ethers.formatEther(signerDifference)} ETH`);
//     // console.log(`Signer2 balance change: ${ethers.formatEther(signer2Difference)} ETH`);
  
//     // console.log("Checking votes for the proposal...");
//     // await gov.checkVotes(await c682.getAddress());
//     // console.log("Votes checked successfully.");
  
//     // console.log("Final active vibes:");
//     // console.log(await gov.showActiveVibes("20", "5"));
  
//   // } catch (e) {
//   //   console.error("Error during governance operations:", e);
//   // }
//   console.log("Approving tokens for router...");
//   const router = new ethers.Contract(
//     "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
//     require("./routerabi.json"),
//     signer
//   );
//   // Approve `toker` tokens for the router
//   await toker.approve(
//     "0x165C3410fC91EF562C50559f7d2289fEbed552d9", // Replace with your router address
//     ethers.parseEther("10000000000000000000000000000000000000000")
//   );
//   console.log("Tokens approved for router.");
  
//   console.log("Adding liquidity to the router...");
//   await router.addLiquidityETH(
//     toker,
//     ethers.parseEther("1000"),
//     "1",
//     "1",
//     "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66",
//     "999999999999999999999",
//     { value: ethers.parseEther(".02")}
//   );
//   console.log(ethers.formatEther(await exxclass.getTraderReward(signer.address)))
//   await exxclass.claimReward()
//   console.log("Liquidity added successfully.");
  
//   console.log("Performing token swap on the router...");
//   await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
//     ethers.parseEther("4300"),
//     "0",
//     [toker, "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"], // Replace with your token addresses
//     "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66",
//     "9999999999999999999999999",
//     {
 
//     }
//   );
//   //await exxclass.claimReward()
//   console.log(ethers.formatEther(await toker.burnBalance(signer.address)))
//   console.log(ethers.formatEther(await toker.burnBalanceOrigin(signer.address)))
//   console.log(await token.retrieveUserVibeList(signer.address));
//   console.log(ethers.formatEther(await exxclass.getTraderReward(signer.address)))
//   await exxclass.claimReward()
//   //await exxclass.claimReward()

//   await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
//     ethers.parseEther("430"),
//     "0",
//     [toker, "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"], // Replace with your token addresses
//     "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66",
//     "9999999999999999999999999",
//     {
 
//     }
//   );
//   console.log(ethers.formatEther(await toker.burnBalance(signer.address)))
//   console.log(ethers.formatEther(await toker.burnBalanceOrigin(signer.address)))
//   console.log(ethers.formatEther(await exxclass.getTraderReward(signer.address)))

//   await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
//     ethers.parseEther("430"),
//     "0",
//     [toker, "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"], // Replace with your token addresses
//     "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66",
//     "9999999999999999999999999",
//     {
 
//     }
//   );
//   console.log(ethers.formatEther(await exxclass.getTraderReward(signer.address)))
//   console.log(ethers.formatEther(await toker.burnBalance(signer.address)))
//   console.log(ethers.formatEther(await toker.burnBalanceOrigin(signer.address)))
//  // await token.addClass(await c362.getAddress(), true, 1, false, 0);
//   await router.addLiquidityETH(
//     toker,
//     ethers.parseEther("100"),
//     "1",
//     "1",
//     "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66",
//     "999999999999999999999",
//     { value: ethers.parseEther(".001")}
//   );
//   console.log("Liquidity added successfully.");
  
//   console.log("Performing token swap on the router...");
//   await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
//     ethers.parseEther("4300"),
//     "0",
//     [toker, "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"], // Replace with your token addresses
//     "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66",
//     "9999999999999999999999999",
//     {
 
//     }
//   );
//   console.log("Token swap executed successfully.");
//   console.log(ethers.formatEther(await exxclass.getTraderReward(signer.address)))
//   console.log("Executing final operations...");

//   await lit.mintPass().catch(e => console.log(`Minting failed: ${e}`));

//   await token.setGov(await gov.getAddress());
//   console.log("Governance set for XUSD.");
//   console.log(await gov.showActiveVibes("20", "5"));
//   console.log("Final logs:");
//   console.log(`Current Price: ${await c5.getCurrentPrice()}`);
//   console.log(await gov.showActiveVibes("20", "5"));
//   console.log(`Governance Votes: ${await gov.showAllProposals("1", "0")}`);
//   console.log(`VibePass Username: ${await lit.getUsername(signer.address)}`);
//  // console.log(`View Rewards: ${await rewarder.viewRewards(signer.address)}`);
//   console.log(`Balance of signer2: ${await toker.balanceOf(signer2.address)}`);
//   console.log(await token.retrieveUserVibeList(signer.address));
//   console.log("Router deployment and operations completed.");
}

// async function deployFactory() {
//   console.log("Starting deployment of SniperWalletFactory...");
//   const Token = await ethers.getContractFactory(`SniperWalletFactory`);
//   const token = await Token.deploy(666);
//   console.log(`SniperWalletFactory deployed at: ${token.address}`);
// }

async function main() {
  console.log("Starting main deployment script...");
  await deployRouter();
  //await deployFactory();
  console.log("Main deployment script completed.");
}

main()
  .then(() => {
    console.log(`Successfully deployed all contracts!`);
    process.exit(0);
  })
  .catch((error) => {
    console.error("Deployment failed:", error);
    process.exitCode = 1;
  });
