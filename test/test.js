const { ethers } = require("hardhat");
const { expect } = require("chai");

describe("VibeRegistry and RewardDistributor integration", function () {
  let RewardDistributor, rewardDistributor;
  let XUSD, xusd;
  let AccessManager, accessManager;
  let VibeRegistry, vibeRegistry;
  let LibRegistryAdd, libRegistryAdd;
  let owner, addr1, addr2;

  before(async function () {
    // Get signers
    [owner, addr1, addr2] = await ethers.getSigners();
    const AccessLib = await ethers.getContractFactory('AuthLib');
    const accessLib = await AccessLib.deploy({
  
    });

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
    const xusd =  await toke.deploy("m", "mm", '100000000000000000000000000', await accessManager.getAddress() );
    await xusd.waitForDeployment();
    console.log(`XUSD deployed at: ${await xusd.getAddress()}`);

    
    const Token = await ethers.getContractFactory('VibeRegistry', {
      libraries: {
        AtropaMath: await lib3C.getAddress(),
        VibeLibRegistry: await libVC.getAddress(),
      },
    });
      let mooo = {
    creatorAddress: owner.address,
    info: "moo",
    level: 0
  }
    const classReg = await ethers.getContractFactory(`RandomizedVibeCalculator`);
    const c6 = await classReg.deploy(10, 300, mooo, await accessManager.getAddress());
    await c6.waitForDeployment()
    const vibeRegistry = await Token.deploy(await accessManager.getAddress(), await xusd.getAddress());
    await vibeRegistry.waitForDeployment();
    //await toker.setRegistry(await token.getAddress())
   

    // Assign VibeRegistry to XUSD
    await xusd.setRegistry(await vibeRegistry.getAddress());

    // Deploy RewardDistributor and link libraries
    RewardDistributor = await ethers.getContractFactory("RewardDistributor", {
      libraries: {
        LibRegistryAdd: await lib22C.getAddress(),
      },
    });
    rewardDistributor = await RewardDistributor.deploy(
      await xusd.getAddress(),
      await accessManager.getAddress(),
      owner.address,
      { creatorAddress: owner.address, info: "Reward Info", level: 1 }
    );
    await rewardDistributor.waitForDeployment();
  });

  it("Should deploy VibeRegistry and link it to XUSD", async function () {
    const registryAddress = await xusd.registry();
    expect(registryAddress).to.equal(await vibeRegistry.getAddress());
  });

  it("Should add VibeRegistry to RewardDistributor and assign class 4", async function () {
    // Add VibeRegistry to RewardDistributor with class 4 and true for processing
    await vibeRegistry.addClass(await RewardDistributor.getAddress(), 4, true);

    // Confirm the class assignment in RewardDistributor
    const classInfo = await vibeRegistry.classInfo(await RewardDistributor.getAddress());
    expect(classInfo.classId).to.equal(4);
    expect(classInfo.isActive).to.be.true;
  });

  it("Should deposit rewards and distribute to VibeRegistry", async function () {
    // Approve tokens to be transferred to RewardDistributor
    await xusd.approve(await rewardDistributor.getAddress(), ethers.parseUnits("1000", 18));

    // Deposit rewards into RewardDistributor
    await rewardDistributor.depositRewards(ethers.parseUnits("1000", 18));

    // Check balance of RewardDistributor
    const balance = await xusd.balanceOf(await rewardDistributor.getAddress());
    expect(balance).to.equal(ethers.parseUnits("1000", 18));
  });

  it("Should allow reward claiming through VibeRegistry", async function () {
    // Assume reward claiming involves interaction with VibeRegistry
    // Claim rewards (mock behavior, as this depends on the actual implementation)
    const initialBalance = await xusd.balanceOf(addr1.address);

    // Assuming there's a function in RewardDistributor to claim rewards for a user via VibeRegistry
    await rewardDistributor.connect(addr1).claimReward(); // Adjust as needed for your contract's method

    const finalBalance = await xusd.balanceOf(addr1.address);
    expect(finalBalance).to.be.gt(initialBalance);
  });

  it("Should correctly revert when trying to addClass with an invalid address", async function () {
    await expect(
      rewardDistributor.addClass(ethers.constants.AddressZero, 4, true)
    ).to.be.revertedWith("Invalid class address");
  });
});
