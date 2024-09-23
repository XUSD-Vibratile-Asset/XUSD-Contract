const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("RewardDistributor", function () {
  let rewardDistributor;
  let owner, user1, user2, lpAddress;
  let xusdToken;

  before(async function () {
    // Get signers
    [owner, user1, user2, lpAddress] = await ethers.getSigners();

    // Deploy a mock ERC20 token to use as xusd
    const MockERC20 = await ethers.getContractFactory("MockERC20");
    xusdToken = await MockERC20.deploy("Mock XUSD", "XUSD", ethers.parseUnits("1000000", 18));
    await xusdToken.waitForDeployment();  // Correct ethers v6 deployment

    // Deploy the RewardDistributor contract
    const RewardDistributor = await ethers.getContractFactory("RewardDistributor");
    const vibeInfo = { description: "Vibe Description", accessManager: owner.address }; // Adjust as per constructor args

    rewardDistributor = await RewardDistributor.deploy(
      xusdToken.target, // xusd token address
      owner.address,    // owner address
      vibeInfo          // VibeBase info (struct)
    );
    await rewardDistributor.waitForDeployment();  // Correct ethers v6 deployment
  });

  describe("Initial State", function () {
    it("should set the correct owner", async function () {
      const contractOwner = await rewardDistributor.owner();
      expect(contractOwner).to.equal(owner.address);
    });

    it("should initialize the XUSD address correctly", async function () {
      const xusdAddress = await rewardDistributor.xusd();
      expect(xusdAddress).to.equal(xusdToken.target);
    });
  });

  describe("Depositing Rewards", function () {
    it("should allow the owner to deposit rewards", async function () {
      const depositAmount = ethers.parseUnits("1000", 18);

      // Approve RewardDistributor to spend XUSD tokens on behalf of owner
      await xusdToken.connect(owner).approve(rewardDistributor.target, depositAmount);

      // Call depositRewards from owner
      await rewardDistributor.connect(owner).depositRewards(depositAmount);

      // Check the updated balance of the contract
      const contractBalance = await xusdToken.balanceOf(rewardDistributor.target);
      expect(contractBalance).to.equal(depositAmount);

      // Check totalSupply in the contract
      const totalSupply = await rewardDistributor.totalSupply();
      expect(totalSupply).to.equal(depositAmount);
    });

    it("should fail if non-owner tries to deposit rewards", async function () {
      const depositAmount = ethers.parseUnits("1000", 18);

      // Non-owner (user1) tries to call depositRewards
      await expect(
        rewardDistributor.connect(user1).depositRewards(depositAmount)
      ).to.be.revertedWith("Not the contract owner");
    });
  });
});
