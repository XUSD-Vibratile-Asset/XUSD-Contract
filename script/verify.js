async function main() {
    const contractAddress = "0x20a7D24FD1E43F0C0b3d434CBD607Ea6a62D5A3a";
    const tupleArgument = [42, "0xAbC...123", true]; // Example tuple argument

let moo = ['0x000006d6aBB723e82a885096bd1e0bcA84a90503', "You buy for goodvibes Module", 0]
  
  
    await hre.run("verify:verify", {
      address: contractAddress,
      constructorArguments: ['0xCB13Ca54A9744aFA2586E6232b94a58cF9B5E25C', '0xEa246e011aF35414F103022883D2A224C35252F3', '0x3BdD7f862F9515d947C19bE824F654036Af0931c'],
    });
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });