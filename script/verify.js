async function main() {
    const contractAddress = "0x53D0407098bfD8596D2ee506E9b05a151a402544";
    let c = '0x45d9a37Af0D2ccb27F09d5D304dff0e691098269'
    let am ='0xf8e006F520ffa3baf5f300818078850130CA259D'
    let librt = '0x360889f18363aD0455eF3B79551e4131a234394f'
    let atropaMath = '0xf71A74b6b32E11A1688c389Bbd918a3621b21F88'


    let shiF = '0x74920B6B6C4bA4E7fE4B304858C6cC1Ab9207FA4'
    let shF = '0x7708D64E64e7188cfC17298E97AF4dB517941c51'
    const tupleArgument = [42, "0xAbC...123", true]; // Example tuple argument

let moo = ['0x000006d6aBB723e82a885096bd1e0bcA84a90503', "You buy for goodvibes Module", 0]
let mooo2 = {
  creatorAddress: '0x000006d6aBB723e82a885096bd1e0bcA84a90503',
  info: "ggen pool",
  level: 0
}
  
    await hre.run("verify:verify", {
      address: '0xa5255A4E00d4e2762EA7e9e1Dc4Ecf68b981e760',
      constructorArguments: ['0xbbeA78397d4d4590882EFcc4820f03074aB2AB29', [], '0', '1727199810', '140000000000000000000000000', '1742319810'],
    });
    // await hre.run("verify:verify", {
    //   address: '0x972acdbb205E4a9a7343d13145C3B699B4Da228d',
    //   constructorArguments: ['0xfdE2198c17ec59Fe87d4bbB26E36a7ce6Ff23e67'],
    // });
    // // await hre.run("verify:verify", {
    // //   address: am,
    // //   constructorArguments: [],
    // // });
    // // await hre.run("verify:verify", {
    // //   address: librt,
    // //   constructorArguments: [],
    // // });
    // // await hre.run("verify:verify", {
    // //   address: atropaMath,
    // //   constructorArguments: [],
    // // });
    // // await hre.run("verify:verify", {
    // //   address: shF,
    // //   constructorArguments: [],
    // // });
    // // await hre.run("verify:verify", {
    // //   address: shiF,
    // //   constructorArguments: [],
    // // });

    // let mooo = {
    //   creatorAddress: '0x000006d6aBB723e82a885096bd1e0bcA84a90503',
    //   info: "trading module",
    //   level: 0
    // }
    // let mooo22 = {
    //   creatorAddress: '0x000006d6aBB723e82a885096bd1e0bcA84a90503',
    //   info: "old vibes",
    //   level: 0
    // }
    // // await hre.run("verify:verify", {
    // //   address: '0x06dF577a83DAB894Eb12F7Acc3959D01b260AF19',
    // //   constructorArguments: ['0xf8e006F520ffa3baf5f300818078850130CA259D'],
    // // });
    // await hre.run("verify:verify", {
    //   address: '0x3327C53e69B5D1cf6e701e791b20CCdE44EaeD7d',
    //   constructorArguments: ['0xfdE2198c17ec59Fe87d4bbB26E36a7ce6Ff23e67', mooo22, '0x010988bA993e2035d280f5654d5fF45bC06Fd652'],
    // });
    // await hre.run("verify:verify", {
    //   address: '0x129bA62D6d1C78a9c803c67a4fa3171f9bf8dE20',
    //   constructorArguments: ['0xfdE2198c17ec59Fe87d4bbB26E36a7ce6Ff23e67', mooo, '0x010988bA993e2035d280f5654d5fF45bC06Fd652'],
    // });
    // // await hre.run("verify:verify", {
    //   address: '0xD50A2e848F8872497E9C83449799c565fe643C8d',
    //   constructorArguments: ['0xf8e006F520ffa3baf5f300818078850130CA259D', '0xbbeA78397d4d4590882EFcc4820f03074aB2AB29', '0x06dF577a83DAB894Eb12F7Acc3959D01b260AF19'],
    // });
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });