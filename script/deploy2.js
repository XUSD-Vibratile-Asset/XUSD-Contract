


const { AbiCoder } = require("ethers");
const { ethers } = require("ethers");
const axios = require('axios');
let abi =  [
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "_rewardPoolImplementation",
        "type": "address"
      }
    ],
    "stateMutability": "nonpayable",
    "type": "constructor"
  },
  {
    "inputs": [
      {
        "internalType": "uint256[]",
        "name": "pids",
        "type": "uint256[]"
      }
    ],
    "name": "claimFromMultiplePools",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "rewardPoolImplementation",
    "outputs": [
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  }
]
async function deployRouter() {
  console.log("Starting deployment of Router...");

 let provider = new ethers.JsonRpcProvider(`https://rpc.pulsechain.com`);
   const signer = new ethers.Wallet(process.env.PK, provider);

   let contract = new ethers.Contract('0xe4E14fC73F1ab583f431968BF143e133e06E2cC4', abi, signer)
//    const nonce = await contract.nonces(signer.address); 
//   // const signer2 = new ethers.Wallet(process.env.PK1, provider);
//   const messageHash = ethers.solidityPackedKeccak256(
//     ['address', 'uint256[]', 'uint256', 'uint256'],
//     [signer.address, [0], '2700000000', nonce]
//   );
  
//   const signature = await signer.signMessage(ethers.getBytes(messageHash))
//   let tx = {
//     to: '0x1e6018b8828EeAB0F5c449C071d0d20A209646D2',
//     data: signature
//   }
// // let g = await signer.sendTransaction(tx);
// console.log(g)
  let t = await contract.claimFromMultiplePools([0])
 console.log(t)
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
