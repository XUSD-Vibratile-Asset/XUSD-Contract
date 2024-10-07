// // SPDX-License-Identifier: UNLICENSED
// pragma solidity ^0.8.0;
// import "./SHIO.sol";
// import "./EnumSet.sol";
//  interface IVibeCalculator {
//         function calculateTotalBasisFee(
//             uint64 aura,
//             uint256[] calldata tradeArray,
//             uint256 category,
//             SHIO calldata cow
//         ) external;
//     }
// /**
//  * @title MyStorageWithVibesAndHashes
//  * @notice This contract stores user and process data, and allows for interaction between them.
//  * Users can be retrieved, processed, and their "vibes" updated based on a unique hash.
//  * It also allows each user to be mapped to multiple "vibes" values via hashes.
//  * @dev Each user is linked to multiple "vibes" values through a mapping of hash values.
//  */
// contract MyStorageWithVibesAndHashes is Context, Ownable {
//        using EnumSet for EnumSet.AddressSet;
//     struct User {
//         address userAddress;
//         uint256 vibes; // Default vibes for simple operations
//     }

//     struct SHIO {
//         address Rod;
//         address Cone;
//     }

//     struct Process {
//         address contractAddress;
//         SHIO SHIO;
//     }

//     uint256 private shioCounter = 0;

//     // Mapping to store each user's primary info by their aura (ID)
//     mapping(uint64 => User) public Users;

//     // Mapping to store SHIOs by their unique IDs
//     mapping(uint256 => SHIO) public SHIOs;

//     // Mapping to store Process data by the user's aura (ID)
//     mapping(uint64 => Process) public Processs;

//     // Mapping to store each user's multiple vibes against unique hash values
//     mapping(address => mapping(uint256 => uint256)) public userVibesByHash;

//     // New mapping to store all hashes associated with a user for summing purposes
//     mapping(address => uint256[]) public userHashes;

//     event UserCreated(uint64 aura, address userAddress);
//     event UserUpdated(uint64 aura, address userAddress, uint256 vibes);
//     event SHIOCreated(uint256 Id, address Rod, address Cone);
//     event SHIOUpdated(uint256 Id, address Rod, address Cone);
//     event ProcessCreated(uint64 aura, address contractAddress, SHIO SHIO);
//     event ProcessUpdated(uint64 aura, address contractAddress, SHIO SHIO);
// EnumSet.AddressSet Processors;

// constructor()Ownable(msg.sender){}
//     /**
//      * @dev Adds a new User record and updates relevant indexes.
//      * @param aura The aura (ID) of the record to add.
//      * @param value The new User record to add.
//      */
//     function addUser(uint64 aura, User calldata value) external onlyOwner {
//         Users[aura] = value;
//         emit UserCreated(aura, value.userAddress);
//     }

//     /**
//      * @dev Adds a new SHIO record and updates relevant indexes.
//      * @param value The new SHIO record to add.
//      * @return The ID of the newly added SHIO record.
//      */
//     function addShio(SHIO calldata value) external onlyOwner returns (uint256) {
//         uint256 Id = shioCounter++;
//         SHIOs[Id] = value;
//         emit SHIOCreated(Id, value.Rod, value.Cone);
//         return Id;
//     }

//     /**
//      * @dev Adds a new Process record and updates relevant indexes.
//      * @param aura The aura of the record to add.
//      * @param value The new Process record to add.
//      */
//     function addProcess(uint64 aura, Process calldata value) external onlyOwner {
//         Processs[aura] = value;
//         emit ProcessCreated(aura, value.contractAddress, value.SHIO);
//     }

//     /**
//      * @dev Processes users against their corresponding processes and updates their vibes based on a unique hash.
//      * @param userAddresses An array of user addresses to retrieve and process.
//      * @param auraList An array of user IDs corresponding to the user addresses.
//      * @param hashList A list of unique hashes corresponding to each user, to categorize different vibes.
//      */
//     function processUsersAndSaveVibesByHash(
//         address[] calldata userAddresses,
//         uint64[] calldata auraList,
//         uint256[] calldata hashList
//     ) external onlyOwner {
//         require(userAddresses.length == auraList.length, "Input length mismatch");
//         require(hashList.length == auraList.length, "Hash length mismatch");

//         for (uint256 i = 0; i < userAddresses.length; i++) {
//             uint64 aura = auraList[i];
//             address userAddr = userAddresses[i];
//             uint256 hash = hashList[i];

//             // Retrieve User and ensure it matches the provided address
//             User storage user = Users[aura];
//             require(user.userAddress == userAddr, "User address mismatch");

//             // Retrieve corresponding process for this user based on aura
//             Process storage process = Processs[aura];
//             require(process.contractAddress != address(0), "No process associated with this user");

//             // Example logic to generate new vibes for this user based on process
//             uint256 newVibes = calculateVibes(process, user);

//             // Save the new vibes in the user->hash->vibes mapping
//             userVibesByHash[userAddr][hash] = newVibes;

//             // Keep track of the hashes associated with this user
//             if (!hashExistsForUser(userAddr, hash)) {
//                 userHashes[userAddr].push(hash);
//             }

//             // Optionally, emit an event with updated vibes for the specific hash
//             emit UserUpdated(aura, user.userAddress, newVibes);
//         }
//     }
//  /**
//      * @dev Internal function to process user classes (associated classAddress) based on given logic.
//      */
//     function processFirstClass() internal {
//         uint64 userAura = generateAura(tx.origin); // Generate user aura (this could be based on the tx.origin or user address).

//         for (uint256 h = 0; h < MasterSecondSet.length(); ) {
//             // Retrieve the class address from the process.
//             address classAddress = Processes[uint64(MasterSecondSet[h])].classAddress;

//             // Generate a unique hash for the current user and class address.
//             uint256 _hash = uint256(keccak256(abi.encodePacked(tx.origin, classAddress)));

//             // If the user has not interacted with this contract (classAddress) yet.
//             if (!userContractMap[_hash]) {
//                 try IVibeCalculator(classAddress).calculateTotalBasisFee(
//                     userAura,
//                     /* Add specific arguments like tradeArray, Cat, and Processes[uint64(MasterSecondSet[h])].SHIO.Cow */
//                     someTradeArray, // Replace with the appropriate array.
//                     someCategory,   // Replace with the appropriate category variable.
//                     Processes[uint64(MasterSecondSet[h])].SHIO
//                 ) {
//                     // Mark this contract interaction as processed.
//                     userContractMap[_hash] = true;

//                     // Emit event to log the success of processing.
//                     emit Processed(userAura, classAddress, true);
//                 } catch {
//                     // In case of failure, we can skip and log the failure if needed.
//                     emit Processed(userAura, classAddress, false);
//                 }
//             } 
//             // If the process needs to be re-processed (e.g., certain conditions or business logic require a re-run).
//             else if (Processes[uint64(MasterSecondSet[h])].process) {
//                 try IVibeCalculator(classAddress).calculateTotalBasisFee(
//                     userAura,
//                     someTradeArray,
//                     someCategory,
//                     Processes[uint64(MasterSecondSet[h])].SHIO
//                 ) {
//                     // Log that the process was re-processed successfully.
//                     emit Processed(userAura, classAddress, true);
//                 } catch {
//                     // Log the failure of the re-processing if necessary.
//                     emit Processed(userAura, classAddress, false);
//                 }
//             }
//             unchecked {
//                 h++; // Increment without overflow checking for gas optimization.
//             }
//         }
//     }

//     /**
//      * @dev Generates an aura based on a user's origin address or other logic.
//      * This function can be customized based on your specific needs.
//      */
//     function generateAura(address user) internal pure returns (uint64) {
//         // Placeholder logic to generate a unique aura for the user.
//         // This can be based on user address or some other property.
//         return uint64(uint256(keccak256(abi.encodePacked(user))) % type(uint64).max);
//     }

//     /**
//      * @dev Example interface for the external Vibe Calculator, replace with your actual interface details.
//      */
   
//     /**
//      * @dev Internal logic to calculate vibes based on process and user data.
//      * This is just a placeholder for custom logic.
//      * @param process The process data associated with the user.
//      * @param user The user data to be processed.
//      * @return The calculated "vibes" as a uint256.
//      */
//     function calculateVibes(Process storage process, User storage user) internal view returns (uint256) {
//         // Example processing logic: Sum the addresses involved in the process and user's current vibes
//         uint256 processVibe = uint256(uint160(process.contractAddress)) +
//                               uint256(uint160(process.SHIO.Rod)) +
//                               uint256(uint160(process.SHIO.Cone));

//         // Combine with current user's vibes as part of some transformation
//         return user.vibes + processVibe;
//     }

//     /**
//      * @dev Helper function to check if a hash exists in the user's hash array.
//      * @param userAddr The address of the user.
//      * @param hash The hash to check.
//      * @return true if the hash exists, false otherwise.
//      */
//     function hashExistsForUser(address userAddr, uint256 hash) internal view returns (bool) {
//         uint256[] memory hashes = userHashes[userAddr];
//         for (uint256 i = 0; i < hashes.length; i++) {
//             if (hashes[i] == hash) {
//                 return true;
//             }
//         }
//         return false;
//     }

//     /**
//      * @dev Retrieves the vibes for a user by a specific hash.
//      * @param userAddr The address of the user.
//      * @param hash The unique hash representing the vibes category.
//      * @return The vibes associated with the given hash.
//      */
//     function getUserVibesByHash(address userAddr, uint256 hash) external view returns (uint256) {
//         return userVibesByHash[userAddr][hash];
//     }

//     /**
//      * @dev Sums all the vibes associated with a user across all stored hashes.
//      * @param userAddr The address of the user to sum the vibes for.
//      * @return The total sum of vibes across all hashes for the user.
//      */
//     function sumUserVibes(address userAddr) external view returns (uint256) {
//         uint256 totalVibes = 0;
//         uint256[] memory hashes = userHashes[userAddr];

//         for (uint256 i = 0; i < hashes.length; i++) {
//             totalVibes += userVibesByHash[userAddr][hashes[i]];
//         }

//         return totalVibes;
//     }

//     /**
//      * @dev Retrieves an array of User records by their IDs.
//      * @param auraList An array of record IDs to retrieve.
//      * @return An array of the retrieved records.
//      */
//     function getUsersByAura(uint64[] calldata auraList) external view returns (User[] memory) {
//         uint256 length = auraList.length;
//         User[] memory result = new User[](length);
//         for (uint256 index = 0; index < length; index++) {
//             result[index] = Users[auraList[index]];
//         }
//         return result;
//     }

//     /**
//      * @dev Retrieves an array of Process records by their IDs.
//      * @param auraList An array of record IDs to retrieve.
//      * @return An array of the retrieved records.
//      */
//     function getProcessesByAura(uint64[] calldata auraList) external view returns (Process[] memory) {
//         uint256 length = auraList.length;
//         Process[] memory result = new Process[](length);
//         for (uint256 index = 0; index < length; index++) {
//             result[index] = Processs[auraList[index]];
//         }
//         return result;
//     }
// }
