const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
const { ethers } = require("hardhat"); // Add ethers import for utils

// const authLib = require("../../artifacts/contracts/Classes/Access.sol/AuthLib.json");
// const libRegistryAdd = require("../../artifacts/contracts/AddressReg.sol/LibRegistryAdd.json");
// const vibeLibRegistry = require("../../artifacts/contracts/VibeLibRegistry.sol/VibeLibRegistry.json");
// const atropaMath = require("../../artifacts/contracts/atropamath.sol/AtropaMath.json");

module.exports = buildModule("RouterDeploymentModule", (m) => {
  // Step 1: Deploy Libraries
  //const basic = m.contract("BasicContract");
  const authLib = m.library("authLib");
  console.log(authLib)
  const libRegistryAdd = m.library("libRegistryAdd");
  const vibeLibRegistry = m.library("vibeLibRegistry");
  const atropaMath = m.library("atropaMath");
  console.log(libRegistryAdd)
  console.log(vibeLibRegistry)
  console.log(atropaMath)

  // Step 2: Deploy AccessManager using AuthLib
  const accessManager = m.contract("AccessManager", {
    libraries: { AuthLib: authLib.libraries },
  });
 
console.log(accessManager)
  // Step 3: Deploy XUSD Token
  const xusd = m.contract("XUSD", ["f", "f", "10000000000000000000000000000000", accessManager]);
  console.log(xusd)
  // Step 4: Set permissions for XUSD
  m.call(accessManager, "grantRole", [xusd, 4]);

  // Step 5: Deploy VibeRegistry using the previously deployed libraries
  const vibeRegistry = m.contract("VibeRegistry", {
    libraries: {
      AtropaMath: atropaMath,
      VibeLibRegistry: vibeLibRegistry,
    },
    args: [accessManager, xusd],
  });

  // Step 6: Grant role to VibeRegistry
  m.call(accessManager, "grantRole", [vibeRegistry, 4]);

  // Step 7: Deploy Reward contract and transfer tokens
  const reward = m.contract("Reward", [xusd]);
  m.call(xusd, "setRegistry", [vibeRegistry]);
  m.call(xusd, "transfer", [reward, ethers.utils.parseEther("100000")]);

  // Step 8: Deploy Exchange contract and set its permissions
  const exchange = m.contract("Exchange", {
    libraries: { LibRegistryAdd: libRegistryAdd },
    args: [
      accessManager,
      xusd,
      reward,
      { creatorAddress: m.deployer.address, info: "moo", level: 0 },
    ],
  });
  m.call(reward, "setExchangeContract", [exchange]);
  m.call(exchange, "addToWhiteListAdmin", [m.deployer.address]);

  // Return the deployed contracts
  return { xusd, vibeRegistry, reward, exchange, accessManager };
});
