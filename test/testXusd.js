// Import necessary libraries and contracts
const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("WhitelistTransactionTracker", function () {
    let tracker, xusd, owner, addr1, addr2, addr3;
    let provider;
    let signer;
    let accessManager;
    let whitelistTransactionTracker;
    let rewardDistributor;
    let libRegistryAdd;
    let libRegistry;
    let authLib;
    beforeEach(async function () {
        provider = new ethers.JsonRpcProvider("https://rpc.pulsechain.com");
        signer = new ethers.Wallet(process.env.PK, provider);

        // Deploy libraries
        const LibRegistry = await ethers.getContractFactory("LibRegistry");
        libRegistry = await LibRegistry.deploy();
        await libRegistry.waitForDeployment();

        const LibRegistryAdd = await ethers.getContractFactory("LibRegistryAdd");
        libRegistryAdd = await LibRegistryAdd.deploy();
        await libRegistryAdd.waitForDeployment();

        const AuthLib = await ethers.getContractFactory("AuthLib");
        authLib = await AuthLib.deploy();
        await authLib.waitForDeployment();

        // Deploy the main contracts with libraries attached
        const WhitelistTransactionTracker = await ethers.getContractFactory("WhitelistTransactionTracker", {
            libraries: {
                LibRegistryAdd: await libRegistryAdd.getAddress(),
                LibRegistry: await libRegistry.getAddress(),
            },
        });
        whitelistTransactionTracker = await WhitelistTransactionTracker.deploy(
            "0xdB117EE426EA72A4A16Bc1f6a791bA9B0e8B8387", // Example address
            "0x66bF18702FCd4975Acf978a135bD65ACf9147EfA", // Example address
            {
                creatorAddress: signer.address,
                info: "moo",
                level: 0,
            }
        );
        await whitelistTransactionTracker.waitForDeployment();

    });

    it("should deploy the WhitelistTransactionTracker contract", async function () {
        expect(await whitelistTransactionTracker.getAddress()).to.be.properAddress;
    });



    it("should deploy the AuthLib contract", async function () {
        expect(await authLib.getAddress()).to.be.properAddress;
    });

    it("should deploy the LibRegistryAdd contract", async function () {
        expect(await libRegistryAdd.getAddress()).to.be.properAddress;
    });

    it("should deploy the LibRegistry contract", async function () {
        expect(await libRegistry.getAddress()).to.be.properAddress;
    });
        // Deploy XUSD mock contract
        const XUSD = await ethers.getContractFactory("XUSD");
        xusd = await XUSD.deploy();
        await xusd.deployed();

        // Deploy WhitelistTransactionTracker contract
        const WhitelistTransactionTracker = await ethers.getContractFactory("WhitelistTransactionTracker");
        tracker = await WhitelistTransactionTracker.deploy(/* constructor parameters */);
        await tracker.deployed();

        [owner, addr1, addr2, addr3] = await ethers.getSigners();
    });

    describe("whitelistAddress", function () {
        it("should allow owner to whitelist an address", async function () {
            await tracker.whitelistAddress(addr1.address, /* router address */);
            expect(await tracker.whitelist(addr1.address)).to.be.true;
        });

        it("should not allow non-owner to whitelist an address", async function () {
            await expect(tracker.connect(addr1).whitelistAddress(addr2.address, /* router address */))
                .to.be.revertedWith("Only owner can perform this action");
        });

        it("should not allow whitelisting the same address twice", async function () {
            await tracker.whitelistAddress(addr1.address, /* router address */);
            await expect(tracker.whitelistAddress(addr1.address, /* router address */))
                .to.be.revertedWith("Already whitelisted");
        });
    });

    describe("calculateRewards", function () {
        it("should track buy amounts correctly", async function () {
            // Setup: whitelist addresses and simulate a transaction
            await tracker.whitelistAddress(addr1.address, /* router address */);
            await tracker.calculateRewards(addr1.address, addr2.address, addr1.address, addr2.address, 1000, 1500);
            const buyAmount = await tracker.getDailyBuyAmount(addr1.address, await tracker.getCurrentDate(), addr1.address);
            expect(buyAmount).to.equal(1000);
        });

        it("should track sell amounts correctly", async function () {
            // Setup: whitelist addresses and simulate a transaction
            await tracker.whitelistAddress(addr1.address, /* router address */);
            await tracker.calculateRewards(addr2.address, addr1.address, addr1.address, addr2.address, 2000, 1500);
            const sellAmount = await tracker.getIndividualDailySellsAndBuys(addr1.address, addr2.address, await tracker.getCurrentDate());
            expect(sellAmount.dailySells).to.equal(2000);
        });
    });

    describe("withdraw", function () {
        it("should allow owner to withdraw rewards", async function () {
            await xusd.mint(tracker.address, ethers.utils.parseEther("100")); // Mint tokens to the contract
            await tracker.depositRewards(ethers.utils.parseEther("100"));
            await tracker.withdraw();
            const balance = await xusd.balanceOf(addr1.address);
            expect(balance).to.equal(ethers.utils.parseEther("100"));
        });

        it("should revert if there are no rewards to withdraw", async function () {
            await expect(tracker.withdraw()).to.be.revertedWith("No rewards to withdraw");
        });
    });

    describe("getUserDispersedAmounts", function () {
        it("should return the correct dispersed amounts for a user", async function () {
            // Simulate dispersal
            await tracker.trackDispersal(addr1.address, 500, 1);
            const dispersedAmount = await tracker.getUserDispersedAmounts(addr1.address, 1);
            expect(dispersedAmount).to.equal(500);
        });
    });

    describe("getAllUsersLpDate", function () {
        it("should return all user LP data for a given date", async function () {
            // Assuming some data has been populated
            await tracker.whitelistAddress(addr1.address, /* router address */);
            await tracker.calculateRewards(addr1.address, addr2.address, addr1.address, addr2.address, 1000, 1500);
            const lpData = await tracker.getAllUsersLpDate(addr1.address, await tracker.getCurrentDate());
            expect(lpData.length).to.be.greaterThan(0); // Ensure there is some data
        });
    });
});