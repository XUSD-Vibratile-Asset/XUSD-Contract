// SPDX-License-Identifier: MIT
// This contract, VibeRegistry, is responsible for managing user vibes, class structures, and reward distribution in a decentralized environment.
// It utilizes access control for secure operations and maintains various mappings and data structures for user profiles, classes, and trades.
// The contract allows for the addition and removal of classes, calculates vibes based on user interactions, and implements reward mechanisms through registered contracts.

pragma solidity ^0.8.26;
import "./AccessControl/AccessorMod.sol";
import "hardhat/console.sol";
import "./math/atropamath.sol";
import "./EnumSet.sol";
import "./vibes/VibeBase.sol";
import "./Trade.sol";
import "./SHIO.sol";
import "./vibes/IShaStorage.sol";
import "./vibes/IVibeCalculator.sol";
import "./unorderedAddress.sol";
import "./unorderedKeySet.sol";

interface SHIOFactory {
    function New(address MathLib) external returns (SHIO);
}

/**
 * @title VibeRegistry
 * @dev This contract manages user vibes, class structures, and reward distribution through multiple registries.
 * Access control is handled via the inherited AccesorMod, providing restrictions on key operations.
 */
contract VibeRegistry is AccesorMod {
    using AtropaMath for address;
    using HitchensUnorderedAddressSetLib for HitchensUnorderedAddressSetLib.Set;
    using HitchensUnorderedKeySetLib for HitchensUnorderedKeySetLib.Set;
    using EnumSet for EnumSet.UintSet;
    // Custom Errors
    error NotAllowedAccess();
    error UnauthorizedAccess(AuthLib.Rank roleId, address addr);

    // Data structures for class and reward management
    struct MasterClass {
        address classAddress;
        SHIO Cow;
        string description;
    }
    struct UserProfileHash {
        address userAddress;
        uint64 aura;
        int vibes;
    }
    struct Sect {
        SHIO Shio;
    }
    struct RewardClass {
        address classAddress;
        SHIO Cow;
        string description;
    }
    SHIO public Cat;
    uint64[] indexer;

    uint64 cacheIndex;
    uint indexIt;
    uint64 public constant MotzkinPrime = 953467954114363;
    HitchensUnorderedAddressSetLib.Set internal MasterClassContractRegistry;
    struct userTrading {
        uint64 userHash;
        uint64 Kappa;
        Trade[] trade;
    }
    HitchensUnorderedAddressSetLib.Set internal MasterUserSet;
    HitchensUnorderedAddressSetLib.Set internal MasterSet;
    HitchensUnorderedAddressSetLib.Set internal MasterSecondSet;
    HitchensUnorderedAddressSetLib.Set internal MasterOneSet;
    mapping(uint => Trade) internal MasterTrader;
    mapping(uint => Trade[]) internal MasterTraderNow;
    mapping(address => MasterClass) internal Master;
    mapping(address => MasterClass) internal MasterSecond;
    mapping(address => MasterClass) internal MasterOne;
    mapping(address => MasterClass) internal MajorMap;
    mapping(address => Sect) internal userSect;
    struct blockish {
        uint blockNum;
        bool flag;
    }

    struct UserC {
        uint64[] userhash;
        uint index;
    }
    mapping(uint => mapping(uint => uint)) internal lastKappa;
    mapping(uint => mapping(uint => mapping(uint => Trade)))
        internal userCacheIndex;
    mapping(uint => mapping(uint => UserC)) internal userCache;
    mapping(uint => mapping(uint => blockish)) internal BlockCache;
    mapping(address => RewardClass) internal MasterClassContractMap;
    mapping(uint64 => UserProfileHash) internal MasterUser;
    mapping(uint => bool) internal userTraded;
    mapping(uint => EnumSet.AddressSet) internal blockAddresses;
    mapping(address => mapping(uint => uint)) internal userContractMap;
    mapping(address => bool) internal whitelistedContracts;
    bool firstFlag = true;
    mapping(address => bool) internal whitelistedLp;
    address mafths = 0xD1CDF9d71f8752034C30893FFE9E073128225B33;
    IShaStorage storageUnit;
    SHIOFactory SHIOf = SHIOFactory(0x546d5151203a1454570D93f0B806eD8999cCB67B);

    uint256 public lastProcessedBlock = 0;

    // Modifier to detect if the block has changed
    /**
     * @dev Modifier to detect the start of a new block and trigger a one-time initialization process.
     * This ensures that a specific process runs once per block.
     */
    modifier blockHasChanged() {
        uint64 userAura = generateAura(tx.origin);
        if (block.number != lastProcessedBlockI[userAura]) {
            console.log("Update");

            Trade[] memory trades = gatherTrades(
                lastProcessedBlockI[generateAura(tx.origin)],
                userAura
            );
            console.log("Update");
            // Add the new _Eta value to userCacheIndex for the current block
            // userCacheIndex[block.number][userAura][_Eta] = _Kappa;

            // Check and increment index correctly

            handleNewBlock(trades);
        }
        _;
        // Update last processed block after function execution
        // console.log("Update");
        lastProcessedBlockI[generateAura(tx.origin)] = block.number;
    }

    /**
     * @dev Handles the initialization process at the start of a new block.
     * This function runs the necessary block-specific setup logic, such as cache updates or data rollovers.
     */

    function handleNewBlock(Trade[] memory trades) internal {
        uint64 userAura = generateAura(tx.origin);

        if (MasterSet.count() > 0) {
            for (uint j = 0; j < MasterSet.count(); ) {
                console.log("MOOII");
                try
                    IVibeCalculator(
                        Master[MasterSet.keyAtIndex(j)].classAddress
                    ).calculateTotalBasisFee(
                            userAura,
                            trades,
                            Cat,
                            Master[MasterSet.keyAtIndex(j)].Cow
                        )
                {} catch (bytes memory reason) {
                    emit RewardsCalculationFailed(
                        Master[MasterSet.keyAtIndex(j)].classAddress,
                        reason
                    );
                }

                unchecked {
                    j++;
                }
            }
        }
        if (MasterOneSet.count() > 0) {
            console.log("MOOII");
            for (uint i; i < MasterOneSet.count(); ) {
                uint _hashim = tx.origin.hashWith(
                    MasterOne[MasterOneSet.keyAtIndex(i)].classAddress
                );
                if (userContractMap[tx.origin][_hashim] == 0) {
                    try
                        IVibeCalculator(
                            MasterOne[MasterOneSet.keyAtIndex(i)].classAddress
                        ).calculateTotalBasisFee(
                                userAura,
                                trades,
                                Cat,
                                MasterOne[MasterOneSet.keyAtIndex(i)].Cow
                            )
                    {
                        userContractMap[tx.origin][_hashim] = _hashim;
                    } catch {}
                }

                unchecked {
                    i++;
                }
            }
        }

        if (MasterSecondSet.count() > 0) {
            console.log("MOOII22222");
            // Process MasterSecondSet vibes calculations
            for (uint j = 0; j < MasterSecondSet.count(); ) {
                // If processing is required, invoke the vibe calculation for this class

                try
                    IVibeCalculator(
                        MasterSecond[MasterSecondSet.keyAtIndex(j)].classAddress
                    ).calculateTotalBasisFee(
                            userAura,
                            trades,
                            Cat,
                            MasterSecond[MasterSecondSet.keyAtIndex(j)].Cow
                        )
                {} catch {
                    // console.log("catch");
                }

                unchecked {
                    j++;
                }
            }
        }

        // Add the _Eta value to the userhash mapping for the current block and user
        // Ensure the currentIndex is within valid bounds (for large arrays or gas consumption management)
    }

    constructor(
        address _accessControl,
        address _storageUnit
    ) AccesorMod(_accessControl) {
        storageUnit = IShaStorage(_storageUnit);
        Cat = SHIOf.New(mafths);
        Cat.Magnetize();
    }
    function generateAura(address user) public pure returns (uint64) {
        return uint64(uint256(uint160(user))) % MotzkinPrime;
    }
    function changeStorage(address newStorage) external onlyConsul {
        storageUnit = IShaStorage(newStorage);
    }

    /**
     * @dev Adds a new transaction and stores it in the block-specific, user-specific cache.
     * Each interaction within a block uses the previous Kappa to generate the next one.
     * @param _to The recipient of the transaction.
     * @param _from The sender of the transaction.
     * @param _amount The amount to be sent.
     */
    function addTransaction(
        address _to,
        address _from,
        uint256 _amount
    ) internal {
        uint64 userAura = generateAura(tx.origin); // Generate user-specific aura
        uint currentBlock = block.number; // Current block number
        uint64 _Eta;
        uint64 _Kappa;

        // Retrieve the stored Kappa for this block and user, or generate a new one
        if (userCache[currentBlock][userAura].userhash.length > 0) {
            // Use the existing Kappa for this block-user combination
            _Kappa = userCache[currentBlock][userAura].userhash[
                userCache[currentBlock][userAura].userhash.length - 1
            ];
            (_Eta, _Kappa) = Cat.Cone().React(_Kappa, Cat.Rod().View().Channel);
        } else {
            // First time in this block, generate a new Eta and Kappa
            (_Eta, _Kappa) = Cat.Cone().React(
                userAura,
                Cat.Rod().View().Channel
            );
        }

        console.logAddress(_to);
        // Create a new trade object and store it in the user's transaction cache for this block
        Trade memory newTrade = Trade({
            to: _to,
            from: _from,
            amount: _amount,
            sender: msg.sender
        });
        userCacheIndex[currentBlock][userAura][_Eta] = newTrade;
        // Store the newly generated Kappa using the block number and user aura
        userCache[currentBlock][userAura].userhash.push(_Eta);
    }

    function gatherTrades(
        uint256 blockNumber,
        uint user
    ) internal view returns (Trade[] memory) {
   
        Trade[] memory tempTrades = new Trade[](
            userCache[blockNumber][user].userhash.length
        );
    

        if (userCache[blockNumber][user].userhash.length > 0) {
            // Iterate over the Kappa values and collect the trades
            for (uint i; i < tempTrades.length; i++) {
                // Resize the array if needed
                console.logAddress(
                    userCacheIndex[blockNumber][user][
                        userCache[blockNumber][user].userhash[i]
                    ].to
                );

                // Collect the trade
                tempTrades[i] = userCacheIndex[blockNumber][user][
                    userCache[blockNumber][user].userhash[i]
                ];

                // Move to the next Kappa in the chain
            }
        }
        // Trim the array to the exact number of trades

        return tempTrades;
    }

    function addClass(address class, uint classType) external onlySenator {
        uint64 aura = generateAura(class);
        SHIO Cow = SHIOf.New(mafths);
        MasterClass memory newClass = MasterClass({
            classAddress: class,
            description: VibeBase(class).getDescription(),
            Cow: Cow
        });
        if (classType == 0) {
            MasterSet.insert(class);
            Master[class] = newClass;
        }

        if (classType == 1) {
            MasterSecondSet.insert(class);
            MasterSecond[class] = newClass;
        }
        if (classType == 2) {
            MasterOneSet.insert(class);
            MasterOne[class] = newClass;
        }
        if (classType == 4) {
            MasterClassContractRegistry.insert(class);
            MasterClassContractMap[class] = RewardClass({
                classAddress: class,
                description: VibeBase(class).getDescription(),
                Cow: Cow
            });
        }
    }

    struct MasterData {
        address classAddress;
    }

    // Mapping of addresses to their associated data

    /**
     * @notice Retrieves the class addresses from MasterOneSet.
     * @return arrayVibes An array of addresses representing class addresses in MasterOne.
     */
    function getAllVibesOne() external view returns (address[] memory) {
        uint256 count = MasterOneSet.count();
        address[] memory arrayVibes = new address[](count);
        for (uint i = 0; i < count; ) {
            arrayVibes[i] = MasterOne[MasterOneSet.keyAtIndex(i)].classAddress;
            unchecked {
                i++;
            }
        }
        return arrayVibes;
    }

    /**
     * @notice Retrieves the class addresses from MasterSet.
     * @return arrayVibes An array of addresses representing class addresses in Master.
     */
    function getAllVibes() external view returns (address[] memory) {
        uint256 count = MasterSet.count();
        address[] memory arrayVibes = new address[](count);
        for (uint i = 0; i < count; ) {
            arrayVibes[i] = Master[MasterSet.keyAtIndex(i)].classAddress;
            unchecked {
                i++;
            }
        }
        return arrayVibes;
    }

    /**
     * @notice Retrieves the class addresses from MasterSecondSet.
     * @return arrayVibes An array of addresses representing class addresses in MasterSecond.
     */
    function getAllVibesSecond() external view returns (address[] memory) {
        uint256 count = MasterSecondSet.count();
        address[] memory arrayVibes = new address[](count);
        for (uint i = 0; i < count; ) {
            arrayVibes[i] = MasterSecond[MasterSecondSet.keyAtIndex(i)]
                .classAddress;
            unchecked {
                i++;
            }
        }
        return arrayVibes;
    }

    /**
     * @notice Retrieves the class addresses from MasterClassContractRegistry.
     * @return arrayVibes An array of addresses representing class addresses in MasterClassContractMap.
     */
    function getAllVibesRewards() external view returns (address[] memory) {
        uint256 count = MasterClassContractRegistry.count();
        address[] memory arrayVibes = new address[](count);
        for (uint i = 0; i < count; ) {
            arrayVibes[i] = MasterClassContractMap[
                MasterClassContractRegistry.keyAtIndex(i)
            ].classAddress;
            unchecked {
                i++;
            }
        }
        return arrayVibes;
    }

    /**
     * @notice Adds a new class address to MasterOneSet.
     * @param classAddress The address to add.
     */
    function addVibeOne(address classAddress) external {
        require(classAddress != address(0), "Invalid address");
        require(
            MasterOne[classAddress].classAddress == address(0),
            "Class already exists"
        );
        SHIO Cow = SHIOf.New(mafths);
        MasterClass memory newClass = MasterClass({
            classAddress: classAddress,
            description: VibeBase(classAddress).getDescription(),
            Cow: Cow
        });
        MasterOneSet.insert(classAddress);
        MasterOne[classAddress] = newClass;
    }

    /**
     * @notice Adds a new class address to MasterSet.
     * @param classAddress The address to add.
     */
    function addVibe(address classAddress) external {
        require(classAddress != address(0), "Invalid address");
        require(
            Master[classAddress].classAddress == address(0),
            "Class already exists"
        );
        SHIO Cow = SHIOf.New(mafths);
        MasterClass memory newClass = MasterClass({
            classAddress: classAddress,
            description: VibeBase(classAddress).getDescription(),
            Cow: Cow
        });
        MasterSet.insert(classAddress);
        Master[classAddress] = newClass;
    }

    /**
     * @notice Adds a new class address to MasterSecondSet.
     * @param classAddress The address to add.
     */
    function addVibeSecond(address classAddress) external {
        require(classAddress != address(0), "Invalid address");
        require(
            MasterSecond[classAddress].classAddress == address(0),
            "Class already exists"
        );
        SHIO Cow = SHIOf.New(mafths);
        MasterClass memory newClass = MasterClass({
            classAddress: classAddress,
            description: VibeBase(classAddress).getDescription(),
            Cow: Cow
        });
        MasterSecondSet.insert(classAddress);
        MasterSecond[classAddress] = newClass;
    }

    /**
     * @notice Adds a new class address to MasterClassContractRegistry.
     * @param classAddress The address to add.
     */
    function addVibeRewards(address classAddress) external {
        require(classAddress != address(0), "Invalid address");
        require(
            MasterClassContractMap[classAddress].classAddress == address(0),
            "Class already exists"
        );
        SHIO Cow = SHIOf.New(mafths);
        RewardClass memory newClass = RewardClass({
            classAddress: classAddress,
            description: VibeBase(classAddress).getDescription(),
            Cow: Cow
        });
        MasterClassContractRegistry.insert(classAddress);
        MasterClassContractMap[classAddress] = newClass;
    }

    function removeVibes(address vibes) external onlySenator {
        Master[vibes].classAddress = address(0);
        MasterSet.remove(vibes);
    }
    function removeOnce(address vibes) external onlySenator {
        MasterOne[vibes].classAddress = address(0);
        MasterOneSet.remove(vibes);
    }
    function removeRewards(address vibes) external onlySenator {
        MasterClassContractMap[vibes].classAddress = address(0);
        MasterClassContractRegistry.remove(vibes);
    }

    function removeSecond(address vibes) external onlySenator {
        MasterSecond[vibes].classAddress = address(0);
        MasterSecondSet.remove(vibes);
    }

    mapping(uint64 => uint) lastProcessedBlockI;

    function checkCache(
        uint hash,
        Trade memory trade
    ) internal blockHasChanged {
        // Process ongoing block, update the cache with new trade data
        addTransaction(trade.to, trade.from, trade.amount);

        // No previous vibes to return on this ongoing block
    }

    /**
     * @notice Calculates vibes for multiple addresses, sums them, and applies to the caller.
     * @param to The address of the recipient.
     * @param from The address of the sender.
     * @param _caller The address of the contract caller.
     * @param sender The address of the transaction initiator.
     * @param amount The amount to process.
     * @return The sum of calculated vibes and the original amount.
     */
    function calculateAndSumBasis(
        address to,
        address from,
        address _caller,
        address sender,
        uint amount
    ) external returns (int, uint) {
        int sumVibes = 0;

        uint64 userAura = generateAura(tx.origin);
        uint Bhash = tx.origin.hashWithHash(block.number);

        Trade memory trade = Trade({
            to: to,
            from: from,
            sender: sender,
            amount: amount
        });
        checkCache(Bhash, trade);
        sumVibes = storageUnit.sumVibesForAura(userAura, tx.origin);
        calculateRewards(to, from, _caller, sender, amount, sumVibes);
        console.logInt(sumVibes);
        return (sumVibes, amount);
    }
    /**
     * @notice View the current vibes of a specific user.
     * @param user The address of the user whose vibes you want to query.
     * @return The current vibes of the user.
     */
    function viewVibes(address user) external view returns (int) {
        return storageUnit.sumVibesForAura(generateAura(user), tx.origin);
    }
    /**
     * @dev Internal function to calculate rewards for users.
     * Calls external reward modules for each active contract class.
     * @param to The address of the recipient.
     * @param from The address of the sender.
     * @param _caller The address of the contract caller.
     * @param sender The address of the transaction initiator.
     * @param amount The amount to process.
     * @param sumVibes The calculated sum of vibes.
     */
    function calculateRewards(
        address to,
        address from,
        address _caller,
        address sender,
        uint amount,
        int sumVibes
    ) internal {
        uint count = MasterClassContractRegistry.count();
        int vibes = storageUnit.sumVibesForAura(
            generateAura(tx.origin),
            tx.origin
        );
        for (uint i; i < count; ) {
            address classHash = MasterClassContractRegistry.keyAtIndex(i);
            RewardClass storage rewardClass = MasterClassContractMap[classHash];
            try
                IRewardsModule(rewardClass.classAddress).calculateRewards(
                    to,
                    from,
                    _caller,
                    sender,
                    amount,
                    vibes
                )
            {
                // Successful reward calculation
            } catch (bytes memory reason) {}
            unchecked {
                i++;
            }
        }
    }
    // Event to log the errors
    event RewardsCalculationFailed(address indexed classHash, bytes reason);
    /**
     * @notice Sets a contract as whitelisted for vibe calculations.
     * @param contractWhite The address of the contract to whitelist.
     * @dev Can only be called by a Senator.
     */
    function setWhitelistedContract(
        address contractWhite
    ) external onlySenator {
        whitelistedContracts[contractWhite] = true;
    }
}
