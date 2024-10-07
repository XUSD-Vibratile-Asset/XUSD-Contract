const { AbiCoder } = require("ethers");
const { ethers } = require("hardhat");
const axios = require('axios');

async function deployRouter() {
  try {
    console.log("Starting deployment of Router...");

    const [signer, signer2] = await ethers.getSigners(); // Get default signers from Hardhat
    console.log("Signers initialized.");
    const s2 = new ethers.Wallet(process.env.PK, 'https://rpc.pulsechain.com')

    // Step 1: Deploy Libraries
    // const AccessLib = await ethers.getContractFactory('AuthLib');
    // const accessLib2 = await AccessLib.deploy();
    // await accessLib2.waitForDeployment(); // In ethers v6, `deployed()` is replaced with `waitForDeployment`
    // console.log(`AuthLib deployed at: ${await accessLib2.getAddress()}`);

    const lib2 = await ethers.getContractFactory('LibRegistry');
    const lib3 = await ethers.getContractFactory('AtropaMath');

    const libe2 = await ethers.getContractFactory('LibRegistryAdd');
    const toke = await ethers.getContractFactory('XUSD');
    const VMREQ = await ethers.getContractFactory('RewardsFiller');

    const toker =  toke.attach('0xbbeA78397d4d4590882EFcc4820f03074aB2AB29');
//     // await vm.waitForDeployment()
//     // console.log(await vm.getAddress())
    const accessManagerFactory = await ethers.getContractFactory('AccessManager', {
      libraries: {
        AuthLib: '0x0ED7aB2b8a3e12150864F400C6899f7564e98F10',
      },
    });
   const accessManager =  await accessManagerFactory.deploy({maxFeePerGas: 966182528810859});
  
//     console.log(`AccessManager deployed at: ${await accessManager.getAddress()}`);
	//await toker.transfer(s2.address, ethers.parseEther("10"));
    // const lib22C = await lib2.deploy();
    // await lib22C.waitForDeployment();
    // console.log(`LibRegistry deployed at: ${await lib22C.getAddress()}`);

    // // const libVC = await libV.deploy();
    // // await libVC.waitForDeployment();
    // // console.log(`VibeLibRegistry deployed at: ${await libVC.getAddress()}`);

    // const lib2C = await toke.deploy();
    // await lib2C.waitForDeployment();
    // console.log(`EnumSet deployed at: ${await lib2C.getAddress()}`);


    const lib3C = await lib3.deploy( );
    await lib3C.waitForDeployment();
     console.log(`AtropaMath deployed at: ${await lib3C.getAddress()}`);
    const Token = await ethers.getContractFactory('VibeRegistry', {
      libraries: {
         AtropaMath: await lib3C.getAddress(),
       
         
        //  LibRegistry: '0xB9e8796BEd82cB0c12f030cDb208307895a5e3B2'
      },
    });

    let mooo223 = {
      creatorAddress: signer.address,
      info: "ggen pool",
      level: 0
    }
  //   let mooo22 = {
  //     creatorAddress: signer.address,
  //     info: "baase",
  //     level: 0
  //   }

      let mooo = {
    creatorAddress: signer.address,
    info: "good vibes",
    level: 0
  }
  let mooo2 = {
    creatorAddress: signer.address,
    info: "New Trading Rewards",
    level: 0
  }

  const b27 = await ethers.getContractFactory(`ShaStorage`);
 const  b2 = await b27.deploy(await accessManager.getAddress());
  await b2.waitForDeployment();
  console.log(await b2.getAddress())
 
    const classReg = await ethers.getContractFactory(`goodVibes`)
	// , {
	// 	libraries: {
	// 		EnumSet: '0xBAe54b6E83B42144C4b8b89691CE0cC843FFc4d0',
					   
	// }});
  const cee6 = await classReg.deploy(await accessManager.getAddress(),  mooo, await b2.getAddress())
  await cee6.waitForDeployment();
  console.log(await cee6.getAddress())

// // //    const c3 = await classReg2.deploy('0xCB13Ca54A9744aFA2586E6232b94a58cF9B5E25C',mooo2);
// // //    await c3.waitForDeployment();
// // //   console.log(await c3.getAddress())




 const classRegw = await ethers.getContractFactory(`LPVibeTracker`);
 const cw6 = await classRegw.deploy(await accessManager.getAddress(),  mooo, await b2.getAddress() );
 await cw6.waitForDeployment();
 console.log(await cw6.getAddress())

  // // //   await c6.waitForDeployment()const t
  const token =  await Token.deploy(await accessManager.getAddress(), await b2.getAddress());
     await token.waitForDeployment();
     console.log(`XUSD deployed at: ${await token.getAddress()}`);

//     //  console.log("Deploying XUSD...");
 // const toker = await toke.deploy("XUSD Vibratile Asset", "XUSD", '100000000000000000000000000', await accessManager.getAddress(), '0x4201C8c73E963CcB05107fa9607cc1614d652588');


   await toker.waitForDeployment();
   console.log(`XUSD deployed at: ${await toker.getAddress()}`);

// // //     // // Grant roles and set permissions
// //   let mooo = {
// //   creatorAddress: signer.address,
// //   info: "Genesis staking Module",
// // //   level: 0,
// // // }
// const classReg33 = await ethers.getContractFactory(`LPVibeTracker2`);
//     // const classReg = await ethers.getContractFactory(`t1`);
//     // const classReg3 = await ethers.getContractFactory(`t2`);
//     const c6 = await classReg33.deploy(await accessManager.getAddress() );
// // //     const c7 = await classReg3.deploy(await accessManager.getAddress(), mooo);

// // //     const c5 = await classReg33.deploy(mooo, await accessManager.getAddress());
//    await c6.waitForDeployment()
await accessManager.grantRole(await cw6.getAddress(), 4);
await accessManager.grantRole(await token.getAddress(), 4);
await accessManager.grantRole(await cee6.getAddress(), 4);
    await token.addClass(await cw6.getAddress(), 1)
// // // //     await token.waitForDeployment();
 await toker.setRegistry(await token.getAddress())
// // //     console.log(`VibeRegistry deployed at: `);

 await accessManager.grantRole(await accessManager.getAddress(), 4);
await accessManager.grantRole(await token.getAddress(), 4);
console.log(await token.viewVibes('0x000006d6aBB723e82a885096bd1e0bcA84a90503'))
// // //     // await accessManager.grantRole('0x65d4fB003774e329682A9B46e2673612a092B40c', 4);
// // //     // await accessManager.grantRole('0x65d4fB003774e329682A9B46e2673612a092B40c', 4);
// // //     console.log("Access rank assigned to ClassRegistry.");
 //await token.addClass(await cw6.getAddress(), 1, true)
 await token.addClass(await cee6.getAddress(), 0)
 await accessManager.grantRole(await cw6.getAddress(), 4);
// // await token.addClass(await c6.getAddress(), 1, true)
await toker.transfer(s2.address, ethers.parseEther("10"));
await toker.transfer(s2.address, ethers.parseEther("10"));
console.log(await token.viewVibes(signer.address))
// await token.addClass(await cw6.getAddress(), 1, false)
// // //await token.addClass(await c5.getAddress(), 1, false, true)
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

//await cw6.addLp('0x79fC0e8d904F7145d7eD2F1E74B96c806e9BF249')





    
// // //     //const rewardDistributor = await RewardDistributor.deploy("50000000000", await toker.getAddress(), await accessManager.getAddress(), await exxclass.getAddress());
// // //     //await rewardDistributor.waitForDeployment();
// // //     //console.log(`Exchange deployed at: ${await exxclass.getAddress()}`);
//  await toker.transfer(s2.address, ethers.parseEther("10"));
// await toker.transfer(s2.address, ethers.parseEther("10"));
// // //    // await reward.setExchangeContract(await exxclass.getAddress());
// // //  //   await exxclass.addToWhiteListAdmin('0xDAb2915b8940BD3B4Bc6BF5Ac80Fa4e558057321', "0x165C3410fC91EF562C50559f7d2289fEbed552d9");
// // //   //  await exxclass.addToWhiteListAdmin(s2.address, "0x165C3410fC91EF562C50559f7d2289fEbed552d9");
// // //    // await token.addClass(await exxclass.getAddress(), 4, true)
// // //     console.log("Exchange whitelist admin added.");
// // //    await toker.transfer(s2.address, ethers.parseEther("100000"));

// // // //console.log(await exxclass.getIndividualSellWeightInPairOnDate(signer.address, signer.address, await exxclass.getCurrentDate()))
// // // //await exxclass.claimReward()
// // // await toker.transfer(s2.address, ethers.parseEther("100000"));

// // await toker.transfer(s2.address, ethers.parseEther("100000"));

// //console.log(await exxclass.getIndividualSellWeightInPairOnDate(signer.address, signer.address, await exxclass.getCurrentDate()))
// //await exxclass.claimReward()
// await toker.transfer(s2.address, ethers.parseEther("100000"));
//   //  await toker.transfer('0x165C3410fC91EF562C50559f7d2289fEbed552d9', ethers.parseEther("100000"));
//    // console.log(await exxclass.getIndividualSellWeightInPairOnDate(signer.address, "0x165C3410fC91EF562C50559f7d2289fEbed552d9", await exxclass.getCurrentDate()))
//   //  await toker.transfer('0x165C3410fC91EF562C50559f7d2289fEbed552d9', ethers.parseEther("100000"));
//    // await exxclass.claimReward()
//   // await toker.approve(await exxclass.getAddress(), "99999999999999999999999999999999999")
// //   console.log(await exxclass.getIndividualBuyWeightInPairOnDate(signer.address, signer.address, await exxclass.getCurrentDate()))
//  //  await exxclass.depositRewards('10000000000000000000000')
//  //   await toker.transfer('0x165C3410fC91EF562C50559f7d2289fEbed552d9', ethers.parseEther("100000"));










//     // const PriceSlowDecay = await ethers.getContractFactory('PriceSlowDecay');
//     // const priceSlowDecay = await PriceSlowDecay.deploy(ethers.parseEther("250000"), ethers.parseEther("10000"), 365);
//     // await priceSlowDecay.waitForDeployment();
//     // console.log(`PriceSlowDecay deployed at: ${await priceSlowDecay.getAddress()}`);
// let moo = {
//   creatorAddress: signer.address,
//   info: "BankTellor",
//   level: 0,
// }
// //bankersRemourse
//     const exClass = await ethers.getContractFactory('BankerTracking', {
//             libraries: { AtropaMath: "0x413C438e8f17fecc6d5Ae3Df8975CA3F68bE312a"},
//           })
    
//     const exxclass = await exClass.deploy('0xCB13Ca54A9744aFA2586E6232b94a58cF9B5E25C', moo);
//     await exxclass.waitForDeployment();
//     console.log(await exxclass.getAddress())

//     // await accessManager.grantRole(await exxclass.getAddress(), 4)
//     //     let oneSwap = toke.attach('0xEb14f3192A37ad2501F3BF6627C565e6799aD661' )
//     // await oneSwap.approve(await exxclass.getAddress(), '999999999999999999999999999999999')
//     // await exxclass.mintPass()

//     // console.log(await exxclass.getUserInfo(signer.address))
//     // console.log(await exxclass.ownerOf(4))
//    // console.log(await exxclass.getAllUsersInfo())









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
    // const MyGovernor = await ethers.getContractFactory('MyGovernor', {
    //   libraries: { LibRegistryAdd: await lib22C.getAddress() },
    // });
    // const governor = await MyGovernor.deploy(await accessManager.getAddress(), await vibePass.getAddress(), await token.getAddress());
    // await governor.waitForDeployment();
    // console.log(`MyGovernor deployed at: ${await governor.getAddress()}`);
    // await accessManager.grantRole(await vibePass.getAddress(), 4);
    // await accessManager.grantRole(await governor.getAddress(), 4);
// //     console.log("Governor role granted.");
let abi = [
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_owner",
				"type": "address"
			}
		],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "address",
				"name": "previousOwner",
				"type": "address"
			},
			{
				"indexed": true,
				"internalType": "address",
				"name": "newOwner",
				"type": "address"
			}
		],
		"name": "OwnershipTransferred",
		"type": "event"
	},
	{
		"inputs": [],
		"name": "WETHBalance",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "balance",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "owner",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "recoverETH",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_token",
				"type": "address"
			}
		],
		"name": "recoverTokens",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "renounceOwnership",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_router",
				"type": "address"
			},
			{
				"internalType": "address[]",
				"name": "path",
				"type": "address[]"
			},
			{
				"internalType": "uint256",
				"name": "amountIn",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "slipage",
				"type": "uint256"
			},
			{
				"internalType": "address",
				"name": "to",
				"type": "address"
			}
		],
		"name": "swapV2",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "newOwner",
				"type": "address"
			}
		],
		"name": "transferOwnership",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
]

const router2 = new ethers.Contract(
  "0x165C3410fC91EF562C50559f7d2289fEbed552d9", // Replace with actual Router address
  require("./routerabi.json"),
  signer
);
// //     // Add liquidity using Router
    const router = new ethers.Contract(
      "0x453ab7510fb3e138333f326D2e4E89B829Cb7185", // Replace with actual Router address
      abi,
      signer
    );
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
// //     await token4.approve(await router2.getAddress(), ethers.parseEther("10000000000000000000000000000000000000000"));
// //     await token3.approve(await router2.getAddress(), ethers.parseEther("10000000000000000000000000000000000000000"));
// //     await token2.approve(await router2.getAddress(), ethers.parseEther("10000000000000000000000000000000000000000"));
    await toker.approve(await router2.getAddress(), ethers.parseEther("10000000000000000000000000000000000000000"));
    await toker.approve(await router.getAddress(), ethers.parseEther("10000000000000000000000000000000000000000"));

  await router2.addLiquidityETH(
    await toker.getAddress(),
    ethers.parseEther("1"),
    "1",
    "1",
    signer.address,
    "999999999999999999999",
    { value: ethers.parseEther("6")  }
  );

//   //await cw6.addLp(await router.getAddress())
// //     console.log("Tokens approved for router.");
    await router.swapV2(
    await router2.getAddress(),
      [ await toker.getAddress(), "0xEb14f3192A37ad2501F3BF6627C565e6799aD661"],
      ethers.parseEther("1"),
      40,    
      s2.address,
     
     
    );
     await toker.transfer(s2.address, ethers.parseEther("10"));

	 await router.swapV2(
		await router2.getAddress(),
		  [ await toker.getAddress(), "0xEb14f3192A37ad2501F3BF6627C565e6799aD661"],
		  ethers.parseEther("10"),
		  40,    
		  s2.address,
		 
		 
		);


		await router.swapV2(
			await router2.getAddress(),
			  [ await toker.getAddress(), "0xEb14f3192A37ad2501F3BF6627C565e6799aD661"],
			  ethers.parseEther("10"),
			  40,    
			  s2.address,
			 
			 
			);
			await router2.addLiquidityETH(
				await toker.getAddress(),
				ethers.parseEther("1"),
				"1",
				"1",
				signer.address,
				"999999999999999999999",
				{ value: ethers.parseEther("6")  }
			  );

	 await router.swapV2(
		await router2.getAddress(),
		  [ await toker.getAddress(), "0xEb14f3192A37ad2501F3BF6627C565e6799aD661"],
		  ethers.parseEther("10"),
		  40,    
		  s2.address,
		 
		 
		);

		console.log(await token.viewVibes(signer.address))

// //     await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens(
   
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
