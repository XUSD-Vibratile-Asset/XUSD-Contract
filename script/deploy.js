const { AbiCoder } = require("ethers");
const { ethers } = require("hardhat");
const axios = require('axios');

async function deployRouter() {
  try {
    console.log("Starting deployment of Router...");

    const [signer, signer2] = await ethers.getSigners(); // Get default signers from Hardhat
    console.log("Signers initialized.");
    const s2 = new ethers.Wallet(process.env.PK1, signer.provider)

    // Step 1: Deploy Libraries
    // const AccessLib = await ethers.getContractFactory('AuthLib');
    // const accessLib = await AccessLib.deploy({
    //   maxFeePerGas: 1383944817052937
    // });
    // await accessLib.waitForDeployment(); // In ethers v6, `deployed()` is replaced with `waitForDeployment`
    // console.log(`AuthLib deployed at: ${await accessLib.getAddress()}`);

    const lib2 = await ethers.getContractFactory('LibRegistry');
    const lib3 = await ethers.getContractFactory('AtropaMath');
    const libV = await ethers.getContractFactory('VibeLibRegistry');
    const libe2 = await ethers.getContractFactory('LibRegistryAdd');
    const toke = await ethers.getContractFactory('XUSD');
    const VMREQ = await ethers.getContractFactory('VMREQ');

    // const vm = await VMREQ.deploy();
    // await vm.waitForDeployment()
    // console.log(await vm.getAddress())
    const accessManagerFactory = await ethers.getContractFactory('AccessManager', {
      libraries: {
        AuthLib: '0xC4D8811f729b26847b4619da49698Be6f94bb912',
      },
    });
      const accessManager =  accessManagerFactory.attach('0xCB13Ca54A9744aFA2586E6232b94a58cF9B5E25C');
    // await accessManager.waitForDeployment();
    // console.log(`AccessManager deployed at: ${await accessManager.getAddress()}`);

    // const lib22C = await libe2.deploy();
    // await lib22C.waitForDeployment();
    // console.log(`LibRegistryAdd deployed at: ${await lib22C.getAddress()}`);

//     const libVC = await libV.deploy();
//     await libVC.waitForDeployment();
//     console.log(`VibeLibRegistry deployed at: ${await libVC.getAddress()}`);

    // const lib2C = await lib2.deploy();
    // await lib2C.waitForDeployment();
    // console.log(`LibRegistry deployed at: ${await lib2C.getAddress()}`);

    //  const lib3C = await lib3.deploy();
    // await lib3C.waitForDeployment();
    // console.log(`AtropaMath deployed at: ${await lib3C.getAddress()}`);

//     // Deploy XUSD
//     //  console.log("Deploying XUSD...");
//    const toker = await toke.deploy("XUSD Vibratile Asset", "XUSD", '100000000000000000000000000', "0xCB13Ca54A9744aFA2586E6232b94a58cF9B5E25C", "0x3246F31aD1b00991965d7A68aeF694C4464d89Eb");


//     await toker.waitForDeployment();
//     console.log(`XUSD deployed at: ${await toker.getAddress()}`);

//     // // Grant roles and set permissions
  
//     const classReg = await ethers.getContractFactory(`RandomizedVibeCalculator`);
//     const c6 = await classReg.deploy(10, 100, mooo, await accessManager.getAddress());
// //     await c6.waitForDeployment()
//  const token = await Token.deploy('0xCB13Ca54A9744aFA2586E6232b94a58cF9B5E25C', await toker.getAddress());
//     await token.waitForDeployment();
//      //await toker.setRegistry(await token.getAddress())
//     console.log(`VibeRegistry deployed at: ${await token.getAddress()}`);

//     await accessManager.grantRole('0x65d4fB003774e329682A9B46e2673612a092B40c', 4);
//     await accessManager.grantRole('0xdfC74f90b8d60eFaa1B66FfF237A423B0C059337', 4);

//     await accessManager.grantRole('0x65d4fB003774e329682A9B46e2673612a092B40c', 4);
//     await accessManager.grantRole('0x65d4fB003774e329682A9B46e2673612a092B40c', 4);
//     console.log("Access rank assigned to ClassRegistry.");
// await token.addClass(await c6.getAddress(), 1, true)
//     // const reward = await class29.deploy(await toker.getAddress());
//     // await reward.waitForDeployment();
// //    console.log(`Reward deployed at: ${await reward.getAddress()}`);
// console.log(signer.address)
//     // Set registry and transfer tokens
//     await toker.setRegistry(await token.getAddress());
//     console.log("XUSD registry set.");
   
//     console.log("Tokens transferred to Reward contract.");
// //await token.setWhitelistedContract(signer.address)
//     // Deploy Exchange

// let moo = {
//   creatorAddress: signer.address,
//   info: "Genesis staking Module",
//   level: 0,
// }





//      const exxclass = await exClass.deploy( '0xbbeA78397d4d4590882EFcc4820f03074aB2AB29', '0xCB13Ca54A9744aFA2586E6232b94a58cF9B5E25C', '0x7164E85A4C9b343255819B5E714B256075C2A5e6', {
//       creatorAddress: signer.address,
//       info: "Genesis Trading Rewards Module",
//       level: 0,
//     });
//     await exxclass.waitForDeployment();
// console.log(await exxclass.getAddress())
//     //const rewardDistributor = await RewardDistributor.deploy("50000000000", await toker.getAddress(), await accessManager.getAddress(), await exxclass.getAddress());
//     //await rewardDistributor.waitForDeployment();
//     //console.log(`Exchange deployed at: ${await exxclass.getAddress()}`);
//   //  await toker.transfer(s2.address, ethers.parseEther("10"));
//    // await reward.setExchangeContract(await exxclass.getAddress());
//     await exxclass.addToWhiteListAdmin('0xDAb2915b8940BD3B4Bc6BF5Ac80Fa4e558057321', "0x165C3410fC91EF562C50559f7d2289fEbed552d9");
//   //  await exxclass.addToWhiteListAdmin(s2.address, "0x165C3410fC91EF562C50559f7d2289fEbed552d9");
//     await token.addClass(await exxclass.getAddress(), 4, true)
//     console.log("Exchange whitelist admin added.");
//   //  await toker.transfer(s2.address, ethers.parseEther("100000"));
// //
// //console.log(await exxclass.getIndividualSellWeightInPairOnDate(signer.address, signer.address, await exxclass.getCurrentDate()))
// //await exxclass.claimReward()
// //await toker.transfer(s2.address, ethers.parseEther("100000"));
//   //  await toker.transfer('0x165C3410fC91EF562C50559f7d2289fEbed552d9', ethers.parseEther("100000"));
//    // console.log(await exxclass.getIndividualSellWeightInPairOnDate(signer.address, "0x165C3410fC91EF562C50559f7d2289fEbed552d9", await exxclass.getCurrentDate()))
//   //  await toker.transfer('0x165C3410fC91EF562C50559f7d2289fEbed552d9', ethers.parseEther("100000"));
//    // await exxclass.claimReward()
//    await toker.approve(await exxclass.getAddress(), "99999999999999999999999999999999999")
// //   console.log(await exxclass.getIndividualBuyWeightInPairOnDate(signer.address, signer.address, await exxclass.getCurrentDate()))
//    await exxclass.depositRewards('10000000000000000000000')
//  //   await toker.transfer('0x165C3410fC91EF562C50559f7d2289fEbed552d9', ethers.parseEther("100000"));










    // const PriceSlowDecay = await ethers.getContractFactory('PriceSlowDecay');
    // const priceSlowDecay = await PriceSlowDecay.deploy(ethers.parseEther("250000"), ethers.parseEther("10000"), 365);
    // await priceSlowDecay.waitForDeployment();
    // console.log(`PriceSlowDecay deployed at: ${await priceSlowDecay.getAddress()}`);
let moo = {
  creatorAddress: signer.address,
  info: "BankTellor",
  level: 0,
}
//bankersRemourse
    const exClass = await ethers.getContractFactory('BankerTracking', {
            libraries: { AtropaMath: "0x413C438e8f17fecc6d5Ae3Df8975CA3F68bE312a"},
          })
    
    const exxclass = await exClass.deploy('0xCB13Ca54A9744aFA2586E6232b94a58cF9B5E25C', moo);
    await exxclass.waitForDeployment();
    console.log(await exxclass.getAddress())

    // await accessManager.grantRole(await exxclass.getAddress(), 4)
    //     let oneSwap = toke.attach('0xEb14f3192A37ad2501F3BF6627C565e6799aD661' )
    // await oneSwap.approve(await exxclass.getAddress(), '999999999999999999999999999999999')
    // await exxclass.mintPass()

    // console.log(await exxclass.getUserInfo(signer.address))
    // console.log(await exxclass.ownerOf(4))
   // console.log(await exxclass.getAllUsersInfo())









// //     // Deploy VibePass
//     const increser = await ethers.getContractFactory('DecreasingOnBuys', {
//       libraries: { LibRegistryAdd: "0x59e2F13063debfA32Ca2fF2DC5CEa5E68B629A3B" },
//     });

//     const i = await increser.deploy('0xCB13Ca54A9744aFA2586E6232b94a58cF9B5E25C', moo )
//     await i.waitForDeployment();
// //     const vibePass = await VibePass.deploy(
// //       "0xEb14f3192A37ad2501F3BF6627C565e6799aD661", // Adjust this address
// //       await accessManager.getAddress(),
// //       await toker.getAddress(),
// //       await priceSlowDecay.getAddress(),
// //       await token.getAddress()
// //     );
// //     await vibePass.waitForDeployment();
//      console.log(`VibePass deployed at: ${await i.getAddress()}`);

//     // Deploy MyGovernor
//     const MyGovernor = await ethers.getContractFactory('MyGovernor', {
//       libraries: { LibRegistryAdd: await lib22C.getAddress() },
//     });
//     const governor = await MyGovernor.deploy(await accessManager.getAddress(), await vibePass.getAddress(), await token.getAddress());
//     await governor.waitForDeployment();
//     console.log(`MyGovernor deployed at: ${await governor.getAddress()}`);
//     await accessManager.grantRole(await vibePass.getAddress(), 4);
//     await accessManager.grantRole(await governor.getAddress(), 4);
// //     console.log("Governor role granted.");

//     // Add liquidity using Router
//     const router = new ethers.Contract(
//       "0x165C3410fC91EF562C50559f7d2289fEbed552d9", // Replace with actual Router address
//       require("./routerabi.json"),
//       signer
//     );
//     const router2 = new ethers.Contract(
//       "0x165C3410fC91EF562C50559f7d2289fEbed552d9", // Replace with actual Router address
//       require("./routerabi.json"),
//       s2
//     );
//     const token2 = new ethers.Contract(
//       await toker.getAddress(), // Replace with actual Router address
//       require("./erc20abi.json"),
//       s2
//     );

//     const token3 = new ethers.Contract(
//       '0xDb2227115f8DB3D6BEC960A170EC8EB8918ef057', // Replace with actual Router address
//       require("./erc20abi.json"),
//       s2
//     );
//     const token4 = new ethers.Contract(
//       '0xDb2227115f8DB3D6BEC960A170EC8EB8918ef057', // Replace with actual Router address
//       require("./erc20abi.json"),
//       signer
//     );

//   //   let oneSwap = toke.attach('0xEb14f3192A37ad2501F3BF6627C565e6799aD661' )
//   //  await oneSwap.approve(await vibePass.getAddress(), '999999999999999999999999999999999')
//   //  await vibePass.mintPass()
// console.log(ethers.formatEther(await exxclass.getUserBalance(signer.address)))
// console.log(ethers.formatEther(await exxclass.getUserBalance(s2.address)))
//     //console.log(await toker.getLatestBurnContract(signer.address))
//    // console.log(ethers.formatEther(await toker.burnBalanceEOA(signer.address)))
//     await token4.approve(await router2.getAddress(), ethers.parseEther("10000000000000000000000000000000000000000"));
//     await token3.approve(await router2.getAddress(), ethers.parseEther("10000000000000000000000000000000000000000"));
//     await token2.approve(await router2.getAddress(), ethers.parseEther("10000000000000000000000000000000000000000"));
//     await toker.approve(await router.getAddress(), ethers.parseEther("10000000000000000000000000000000000000000"));
//     console.log("Tokens approved for router.");
//     await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens(
   
//       ethers.parseEther("300"),
//       0,
//       [await toker.getAddress(), '0xDb2227115f8DB3D6BEC960A170EC8EB8918ef057'],
//       s2.address,
//      '99999999999999999999999999999999999'
//     );

//     await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens(
   
//       ethers.parseEther("10"),
//       0,
//       ['0xDb2227115f8DB3D6BEC960A170EC8EB8918ef057', await toker.getAddress()],
//       s2.address,
//      '99999999999999999999999999999999999'
//     );
//     await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens(
   
//       ethers.parseEther("60"),
//       0,
//       [await toker.getAddress(), '0xDb2227115f8DB3D6BEC960A170EC8EB8918ef057'],
//       s2.address,
//      '99999999999999999999999999999999999'
//     );

//     await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
   
//       ethers.parseEther("1"),
//       0,
//       [await toker.getAddress(), '0xDb2227115f8DB3D6BEC960A170EC8EB8918ef057'],
//       signer.address,
//      '99999999999999999999999999999999999'
//     );

//     await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
   
//       ethers.parseEther("1"),
//       0,
//       ['0xDb2227115f8DB3D6BEC960A170EC8EB8918ef057', await toker.getAddress()],
//       signer.address,
//      '99999999999999999999999999999999999'
//     );

   


//    // console.log(await exxclass.getUserDispersedAmounts(signer.address, await exxclass.getCurrentDate()))
//  //await exxclass.withdraw( )
//  //console.log(ethers.formatEther(await exxclass.dailyUserTotalRewards()))
//  //await exxclass.withdraw( )
//     console.log((await exxclass.getUserTradingDataRewards('0xDAb2915b8940BD3B4Bc6BF5Ac80Fa4e558057321', signer.address, 0)))
//     console.log((await exxclass.getUserTradingDataRewards('0xDAb2915b8940BD3B4Bc6BF5Ac80Fa4e558057321', s2.address, await exxclass.getCurrentEpoch())))
//     let hh = await exxclass.getDatesArray()///
//     console.log(hh)
// ///console.log( await exxclass.getAllUsersLpDate('0xDAb2915b8940BD3B4Bc6BF5Ac80Fa4e558057321', hh[0]))
//     console.log("Liquidity added to router.");
//   //  console.log(await rewardDistributor.getUserBalance('0xDAb2915b8940BD3B4Bc6BF5Ac80Fa4e558057321',  await exxclass.getCurrentDate()))
// console.log(await toker.getLatestBurn(signer.address))
// console.log(await toker.totalBurned())
    console.log("Deployment and interactions completed successfully.");
  } catch (error) {
    console.error("Error during deployment:", error);
  }
}

async function main() {
  console.log("Starting main deployment script...");
  await deployRouter();
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
