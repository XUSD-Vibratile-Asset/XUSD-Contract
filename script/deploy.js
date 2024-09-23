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
    const AccessLib = await ethers.getContractFactory('AuthLib');
    const accessLib = await AccessLib.deploy({
      maxFeePerGas: 1383944817052937
    });
    await accessLib.waitForDeployment(); // In ethers v6, `deployed()` is replaced with `waitForDeployment`
    console.log(`AuthLib deployed at: ${await accessLib.getAddress()}`);

    const lib2 = await ethers.getContractFactory('LibRegistry');
    const lib3 = await ethers.getContractFactory('AtropaMath');
    const libV = await ethers.getContractFactory('VibeLibRegistry');
    const libe2 = await ethers.getContractFactory('LibRegistryAdd');
    const toke = await ethers.getContractFactory('XUSD');
    const VMREQ = await ethers.getContractFactory('VMREQ');

    const vm = await VMREQ.deploy();
    await vm.waitForDeployment()
    const accessManagerFactory = await ethers.getContractFactory('AccessManager', {
      libraries: {
        AuthLib: await accessLib.getAddress(),
      },
    });
    const accessManager = await accessManagerFactory.deploy();
    await accessManager.waitForDeployment();
    console.log(`AccessManager deployed at: ${await accessManager.getAddress()}`);

    const lib22C = await libe2.deploy();
    await lib22C.waitForDeployment();
    console.log(`LibRegistryAdd deployed at: ${await lib22C.getAddress()}`);

    const libVC = await libV.deploy();
    await libVC.waitForDeployment();
    console.log(`VibeLibRegistry deployed at: ${await libVC.getAddress()}`);

    const lib2C = await lib2.deploy();
    await lib2C.waitForDeployment();
    console.log(`LibRegistry deployed at: ${await lib2C.getAddress()}`);

    const lib3C = await lib3.deploy();
    await lib3C.waitForDeployment();
    console.log(`AtropaMath deployed at: ${await lib3C.getAddress()}`);

    // Deploy XUSD
    console.log("Deploying XUSD...");
    const toker =  await toke.deploy("m", "mm", '100000000000000000000000000', await accessManager.getAddress() );
    await toker.waitForDeployment();
    console.log(`XUSD deployed at: ${await toker.getAddress()}`);

    // Grant roles and set permissions
    await accessManager.grantRole(await toker.getAddress(), 4);
    console.log("Access rank assigned to XUSD.");

    const class29 = await ethers.getContractFactory('Reward');
    const Token = await ethers.getContractFactory('VibeRegistry', {
      libraries: {
        AtropaMath: await lib3C.getAddress(),
        VibeLibRegistry: await libVC.getAddress(),
      },
    });
      let mooo = {
    creatorAddress: signer.address,
    info: "moo",
    level: 0
  }
    const classReg = await ethers.getContractFactory(`RandomizedVibeCalculator`);
    const c6 = await classReg.deploy(10, 300, mooo, await accessManager.getAddress());
    await c6.waitForDeployment()
    const token = await Token.deploy(await accessManager.getAddress(), await toker.getAddress());
    await token.waitForDeployment();
    await toker.setRegistry(await token.getAddress())
    console.log(`VibeRegistry deployed at: ${await token.getAddress()}`);

    await accessManager.grantRole(await token.getAddress(), 4);
    console.log("Access rank assigned to ClassRegistry.");
await token.addClass(await c6.getAddress(), 1, true)
    // const reward = await class29.deploy(await toker.getAddress());
    // await reward.waitForDeployment();
//    console.log(`Reward deployed at: ${await reward.getAddress()}`);
console.log(signer.address)
    // Set registry and transfer tokens
    await toker.setRegistry(await token.getAddress());
    console.log("XUSD registry set.");
   
    console.log("Tokens transferred to Reward contract.");
//await token.setWhitelistedContract(signer.address)
    // Deploy Exchange
    const exClass = await ethers.getContractFactory('RewardDistributor', {
     libraries: { LibRegistryAdd: await lib22C.getAddress(),
     
      },
    });



    const exxclass = await exClass.deploy( await toker.getAddress(), await accessManager.getAddress(), await vm.getAddress(), {
      creatorAddress: signer.address,
      info: "moo",
      level: 0,
    });
    await exxclass.waitForDeployment();

    //const rewardDistributor = await RewardDistributor.deploy("50000000000", await toker.getAddress(), await accessManager.getAddress(), await exxclass.getAddress());
    //await rewardDistributor.waitForDeployment();
    console.log(`Exchange deployed at: ${await exxclass.getAddress()}`);
    await toker.transfer(s2.address, ethers.parseEther("10"));
   // await reward.setExchangeContract(await exxclass.getAddress());
  //  await exxclass.addToWhiteListAdmin('0xDAb2915b8940BD3B4Bc6BF5Ac80Fa4e558057321', "0x165C3410fC91EF562C50559f7d2289fEbed552d9");
  //  await exxclass.addToWhiteListAdmin(s2.address, "0x165C3410fC91EF562C50559f7d2289fEbed552d9");
    await token.addClass(await exxclass.getAddress(), 4, true)
    console.log("Exchange whitelist admin added.");
    await toker.transfer(s2.address, ethers.parseEther("100000"));

//console.log(await exxclass.getIndividualSellWeightInPairOnDate(signer.address, signer.address, await exxclass.getCurrentDate()))
//await exxclass.claimReward()
await toker.transfer(s2.address, ethers.parseEther("100000"));
    await toker.transfer('0x165C3410fC91EF562C50559f7d2289fEbed552d9', ethers.parseEther("100000"));
   // console.log(await exxclass.getIndividualSellWeightInPairOnDate(signer.address, "0x165C3410fC91EF562C50559f7d2289fEbed552d9", await exxclass.getCurrentDate()))
    await toker.transfer('0x165C3410fC91EF562C50559f7d2289fEbed552d9', ethers.parseEther("100000"));
   // await exxclass.claimReward()
   await toker.approve(await exxclass.getAddress(), "99999999999999999999999999999999999")
//   console.log(await exxclass.getIndividualBuyWeightInPairOnDate(signer.address, signer.address, await exxclass.getCurrentDate()))
   await exxclass.depositRewards('10000000000000000000000')
    await toker.transfer('0x165C3410fC91EF562C50559f7d2289fEbed552d9', ethers.parseEther("100000"));
    const PriceSlowDecay = await ethers.getContractFactory('PriceSlowDecay');
    const priceSlowDecay = await PriceSlowDecay.deploy(ethers.parseEther(".1"), ethers.parseEther(".0001"), 300);
    await priceSlowDecay.waitForDeployment();
    console.log(`PriceSlowDecay deployed at: ${await priceSlowDecay.getAddress()}`);

    // Deploy VibePass
    const VibePass = await ethers.getContractFactory('VibePass', {
      libraries: { LibRegistry: await lib2C.getAddress() },
    });
    const vibePass = await VibePass.deploy(
      "0xEb14f3192A37ad2501F3BF6627C565e6799aD661", // Adjust this address
      await accessManager.getAddress(),
      await toker.getAddress(),
      await priceSlowDecay.getAddress(),
      await token.getAddress()
    );
    await vibePass.waitForDeployment();
    console.log(`VibePass deployed at: ${await vibePass.getAddress()}`);

    // Deploy MyGovernor
    const MyGovernor = await ethers.getContractFactory('MyGovernor', {
      libraries: { LibRegistryAdd: await lib22C.getAddress() },
    });
    const governor = await MyGovernor.deploy(await accessManager.getAddress(), await vibePass.getAddress(), await token.getAddress());
    await governor.waitForDeployment();
    console.log(`MyGovernor deployed at: ${await governor.getAddress()}`);
    await accessManager.grantRole(await vibePass.getAddress(), 4);
    await accessManager.grantRole(await governor.getAddress(), 4);
    console.log("Governor role granted.");

    // Add liquidity using Router
    const router = new ethers.Contract(
      "0x165C3410fC91EF562C50559f7d2289fEbed552d9", // Replace with actual Router address
      require("./routerabi.json"),
      signer
    );
    const router2 = new ethers.Contract(
      "0x165C3410fC91EF562C50559f7d2289fEbed552d9", // Replace with actual Router address
      require("./routerabi.json"),
      s2
    );
    const token2 = new ethers.Contract(
      await toker.getAddress(), // Replace with actual Router address
      require("./erc20abi.json"),
      s2
    );

    const token3 = new ethers.Contract(
      '0xDb2227115f8DB3D6BEC960A170EC8EB8918ef057', // Replace with actual Router address
      require("./erc20abi.json"),
      s2
    );
    const token4 = new ethers.Contract(
      '0xDb2227115f8DB3D6BEC960A170EC8EB8918ef057', // Replace with actual Router address
      require("./erc20abi.json"),
      signer
    );
    console.log(await toker.getFullBurnHistoryEOA(signer.address))

    await token4.approve(await router2.getAddress(), ethers.parseEther("10000000000000000000000000000000000000000"));
    await token3.approve(await router2.getAddress(), ethers.parseEther("10000000000000000000000000000000000000000"));
    await token2.approve(await router2.getAddress(), ethers.parseEther("10000000000000000000000000000000000000000"));
    await toker.approve(await router.getAddress(), ethers.parseEther("10000000000000000000000000000000000000000"));
    console.log("Tokens approved for router.");
    await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens(
   
      ethers.parseEther("300"),
      0,
      [await toker.getAddress(), '0xDb2227115f8DB3D6BEC960A170EC8EB8918ef057'],
      s2.address,
     '99999999999999999999999999999999999'
    );

    await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens(
   
      ethers.parseEther("10"),
      0,
      ['0xDb2227115f8DB3D6BEC960A170EC8EB8918ef057', await toker.getAddress()],
      s2.address,
     '99999999999999999999999999999999999'
    );
    await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens(
   
      ethers.parseEther("60"),
      0,
      [await toker.getAddress(), '0xDb2227115f8DB3D6BEC960A170EC8EB8918ef057'],
      s2.address,
     '99999999999999999999999999999999999'
    );

    await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
   
      ethers.parseEther("1"),
      0,
      [await toker.getAddress(), '0xDb2227115f8DB3D6BEC960A170EC8EB8918ef057'],
      signer.address,
     '99999999999999999999999999999999999'
    );

    await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
   
      ethers.parseEther("1"),
      0,
      ['0xDb2227115f8DB3D6BEC960A170EC8EB8918ef057', await toker.getAddress()],
      signer.address,
     '99999999999999999999999999999999999'
    );

   

    let oneSwap = toke.attach('0xEb14f3192A37ad2501F3BF6627C565e6799aD661' )
   // await oneSwap.approve(await vibePass.getAddress(), '999999999999999999999999999999999')
//    await vibePass.mintPass()
console.log(ethers.formatEther(await exxclass.getUserBalance(signer.address)))
console.log(ethers.formatEther(await exxclass.getUserBalance(s2.address)))

   // console.log(await exxclass.getUserDispersedAmounts(signer.address, await exxclass.getCurrentDate()))
 //await exxclass.withdraw( )
 //console.log(ethers.formatEther(await exxclass.dailyUserTotalRewards()))
 //await exxclass.withdraw( )
    console.log((await exxclass.getUserTradingDataRewards('0xDAb2915b8940BD3B4Bc6BF5Ac80Fa4e558057321', signer.address, 0)))
    console.log((await exxclass.getUserTradingDataRewards('0xDAb2915b8940BD3B4Bc6BF5Ac80Fa4e558057321', s2.address, await exxclass.getCurrentEpoch())))
    let hh = await exxclass.getDatesArray()///
    console.log(hh)
///console.log( await exxclass.getAllUsersLpDate('0xDAb2915b8940BD3B4Bc6BF5Ac80Fa4e558057321', hh[0]))
    console.log("Liquidity added to router.");
  //  console.log(await rewardDistributor.getUserBalance('0xDAb2915b8940BD3B4Bc6BF5Ac80Fa4e558057321',  await exxclass.getCurrentDate()))
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
