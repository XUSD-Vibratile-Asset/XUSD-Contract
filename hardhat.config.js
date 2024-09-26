require("@nomicfoundation/hardhat-toolbox");
require("@nomicfoundation/hardhat-ignition-ethers");
require('@openzeppelin/hardhat-upgrades');
 require('@primitivefi/hardhat-dodoc');
require('dotenv').config()
require('@primitivefi/hardhat-marmite');
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
 
solidity: {
    compilers: [
      {
        version:  "0.6.6",
      },
      {
        version: "0.8.26",
        
      },
    ],
  },
  settings: {
    optimizer: {
      enabled: true,
      runs: 1000,
    },
   
  },
  networks: {
    pulsechain: {
      url:  `https://rpc.pulsechain.com/`,
      accounts: [process.env.PK],
     
    },
    
  },
  etherscan: {
    // Your API key for Etherscan
    // Obtain one at https://etherscan.io/
    apiKey: {

      pulsechain: "https://api.scan.pulsechain.com/api/",
    },
    customChains: [
      {
        network: "metis",
        chainId: 1088,
        urls: {
          apiURL: "https://andromeda-explorer.metis.io/api",
          browserURL: "https://andromeda-explorer.metis.io/",
        },
      },
      {
      network: "pulsechain",
  chainId: 369,
  urls: {
    apiURL: "https://api.scan.pulsechain.com/api/",
    browserURL: "https://scan.v3.testnet.pulsechain.com",
  },
},
      {
        network: "zkevm",
        chainId: 1101,
        urls: {
          apiURL: "https://api-zkevm.polygonscan.com/api",
          browserURL: "https://zkevm.polygonscan.com/",
        },
      },
    ],
  
},
  
};
