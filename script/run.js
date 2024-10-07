const { AbiCoder } = require("ethers");
const { ethers } = require("hardhat");
const axios = require('axios');

async function deployRouter() {
  try {
   let a = 

   [
       
       {
         "amount": "2889160435985297193641",
         "id": "369_21580557_0",
         "user": "0x154F6Fec94086921B8B4C1ec8ce5da4518873cC5",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "3648976506166398347291",
         "id": "369_21580558_14",
         "user": "0x154F6Fec94086921B8B4C1ec8ce5da4518873cC5",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "3260773910097681300597",
         "id": "369_21580558_16",
         "user": "0x154F6Fec94086921B8B4C1ec8ce5da4518873cC5",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "44268388642870747461932",
         "id": "369_21580563_0",
         "user": "0x30a50dFDa3CD56EA15609973Ee082408975766ae",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "23594314724006707884420",
         "id": "369_21580566_136",
         "user": "0x30a50dFDa3CD56EA15609973Ee082408975766ae",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "16852801979656669260100",
         "id": "369_21580596_91",
         "user": "0x30a50dFDa3CD56EA15609973Ee082408975766ae",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "273488536048407603628",
         "id": "369_21580650_255",
         "user": "0x30a50dFDa3CD56EA15609973Ee082408975766ae",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "362198374456000000000",
         "id": "369_21580661_684",
         "user": "0x30a50dFDa3CD56EA15609973Ee082408975766ae",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "66761012361045841402",
         "id": "369_21580673_570",
         "user": "0x30a50dFDa3CD56EA15609973Ee082408975766ae",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "162711968097702633904",
         "id": "369_21580715_67",
         "user": "0xd75e421a43638f01D2B0f19ae42938B5264591cF",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "536205927953183316814",
         "id": "369_21580738_56",
         "user": "0xD12a5a8f80750137b9D069dC0E9735d46F324E21",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "3711020919812655081529",
         "id": "369_21580743_0",
         "user": "0xD12a5a8f80750137b9D069dC0E9735d46F324E21",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "1401364561225000000000",
         "id": "369_21580745_49",
         "user": "0xD12a5a8f80750137b9D069dC0E9735d46F324E21",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "1374441637061194317499",
         "id": "369_21580748_32",
         "user": "0xD12a5a8f80750137b9D069dC0E9735d46F324E21",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "1007612259781373779835",
         "id": "369_21580751_106",
         "user": "0xD12a5a8f80750137b9D069dC0E9735d46F324E21",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "674713102159565143408",
         "id": "369_21580757_6",
         "user": "0xD12a5a8f80750137b9D069dC0E9735d46F324E21",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "1610727518055398176843",
         "id": "369_21580922_10",
         "user": "0xcB246C1121EE67E49A7EfA307874a210B76Bd0C0",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "119129181039584526500",
         "id": "369_21581162_154",
         "user": "0x2cC35b9540BaA2ab79aDc8E3688767bB92AD985B",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "275516958709613783400",
         "id": "369_21581164_257",
         "user": "0x2cC35b9540BaA2ab79aDc8E3688767bB92AD985B",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "56710923573193630899038",
         "id": "369_21581173_146",
         "user": "0xA2b40c3a7F1989e7A059273c8bc190bA91aE8771",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "1190511113841620711583",
         "id": "369_21581179_106",
         "user": "0xfb6B164378e09f57B58358aAFc15102E07f4189f",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "426551356940178930875",
         "id": "369_21581197_56",
         "user": "0xfb6B164378e09f57B58358aAFc15102E07f4189f",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "580683155979087449665",
         "id": "369_21581248_41",
         "user": "0x5e44Cc5f4b9C72da141E425F11A2Cc0111bAeB58",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "508761128980995768552",
         "id": "369_21581251_0",
         "user": "0x5e44Cc5f4b9C72da141E425F11A2Cc0111bAeB58",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "2354577287056971136623",
         "id": "369_21581254_0",
         "user": "0x5e44Cc5f4b9C72da141E425F11A2Cc0111bAeB58",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "195",
         "id": "369_21581260_400",
         "user": "0x5e44Cc5f4b9C72da141E425F11A2Cc0111bAeB58",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "691845765920000000000",
         "id": "369_21581267_83",
         "user": "0x5e44Cc5f4b9C72da141E425F11A2Cc0111bAeB58",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       },
       {
         "amount": "2745220294462591220790",
         "id": "369_21581272_7",
         "user": "0x5e44Cc5f4b9C72da141E425F11A2Cc0111bAeB58",
         "db_write_timestamp": "2024-10-04T21:25:33.402097"
       }
      
     ]

let abi = [
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "_Xusd",
          "type": "address"
        },
        {
          "internalType": "address[]",
          "name": "comissionTokens_",
          "type": "address[]"
        },
        {
          "internalType": "uint256",
          "name": "_comissionPercent",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "_poolStartTime",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "_totalRewards",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "_runningTime",
          "type": "uint256"
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
          "name": "user",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "uint256",
          "name": "pid",
          "type": "uint256"
        },
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "amount",
          "type": "uint256"
        }
      ],
      "name": "Deposit",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "user",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "uint256",
          "name": "pid",
          "type": "uint256"
        },
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "amount",
          "type": "uint256"
        }
      ],
      "name": "EmergencyWithdraw",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "user",
          "type": "address"
        },
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "amount",
          "type": "uint256"
        }
      ],
      "name": "RewardPaid",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "user",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "uint256",
          "name": "pid",
          "type": "uint256"
        },
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "amount",
          "type": "uint256"
        }
      ],
      "name": "Withdraw",
      "type": "event"
    },
    {
      "inputs": [],
      "name": "Xusd",
      "outputs": [
        {
          "internalType": "contract IERC20",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "XusdPerSecond",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "_allocPoint",
          "type": "uint256"
        },
        {
          "internalType": "contract IERC20",
          "name": "_token",
          "type": "address"
        },
        {
          "internalType": "bool",
          "name": "_withUpdate",
          "type": "bool"
        },
        {
          "internalType": "uint256",
          "name": "_lastRewardTime",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "_maxDeposit",
          "type": "uint256"
        }
      ],
      "name": "add",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "comissionPercent",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "index",
          "type": "uint256"
        }
      ],
      "name": "comissionToken",
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
      "name": "comissionTokensCount",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "_pid",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "_amount",
          "type": "uint256"
        }
      ],
      "name": "deposit",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "_pid",
          "type": "uint256"
        }
      ],
      "name": "emergencyWithdraw",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "_fromTime",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "_toTime",
          "type": "uint256"
        }
      ],
      "name": "getGeneratedReward",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "contract IERC20",
          "name": "_token",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "amount",
          "type": "uint256"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        }
      ],
      "name": "governanceRecoverUnsupported",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "massUpdatePools",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "operator",
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
      "inputs": [
        {
          "internalType": "uint256",
          "name": "_pid",
          "type": "uint256"
        },
        {
          "internalType": "address",
          "name": "_user",
          "type": "address"
        }
      ],
      "name": "pendingXusd",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "poolEndTime",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "name": "poolInfo",
      "outputs": [
        {
          "internalType": "contract IERC20",
          "name": "token",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "allocPoint",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "lastRewardTime",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "accXusdPerShare",
          "type": "uint256"
        },
        {
          "internalType": "bool",
          "name": "isStarted",
          "type": "bool"
        },
        {
          "internalType": "uint256",
          "name": "maxDeposit",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "poolStartTime",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "runningTime",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "_pid",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "_allocPoint",
          "type": "uint256"
        }
      ],
      "name": "set",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "_operator",
          "type": "address"
        }
      ],
      "name": "setOperator",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "totalAllocPoint",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "totalRewards",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "_pid",
          "type": "uint256"
        }
      ],
      "name": "updatePool",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        },
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "name": "userInfo",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "amount",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "rewardDebt",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "_pid",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "_amount",
          "type": "uint256"
        }
      ],
      "name": "withdraw",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    }
  ]

const contractAddress = '0xa5255A4E00d4e2762EA7e9e1Dc4Ecf68b981e760'
let provider = new ethers.JsonRpcProvider(`https://rpc.pulsechain.com`)
const contract = new ethers.Contract(contractAddress, abi, provider)
const VMREQ = await ethers.getContractFactory('XUSD');

      const toker =  VMREQ.attach('0xbbeA78397d4d4590882EFcc4820f03074aB2AB29');
let userSums = {};

for (let i = 0; i < a.length; i++) {
  let user = a[i].user;
  let amount = Number(a[i].amount);
  
  if (!userSums[user]) {
    userSums[user] = 0;
  }
  
  userSums[user] += amount;
}

// Convert user sums object into an array
let userArray = Object.keys(userSums).map(user => {
  return {
    user: user,
    amount: BigInt(userSums[user])
  };
});

console.log(userArray);

for(let i = 0; i < userArray.length; i ++){
  let t = await toker.transfer(userArray[i].user, userArray[i].amount)
  t.wait()
  console.log(t)
}

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
