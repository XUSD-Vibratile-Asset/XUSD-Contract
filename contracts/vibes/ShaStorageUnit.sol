// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "../EnumSet.sol";
import "../AccessControl/AccessorMod.sol";
import "../vibes/VibeBase.sol";
import "hardhat/console.sol";
import "../unorderedKeySet.sol";
import "../SHIO.sol";

interface SHIOFactory {
    function New(address MathLib) external returns (SHIO);
}

interface IProcessor {
    function process(address user) external returns (int);
}

/**
 * @title ShaStorage
 * @dev A contract that allows saving, retrieving, and summing `vibes` for each `aura` and `kappa` combination,
 *      using `EnumSet` for efficiently iterating over `kappa` values per `aura`.
 */
contract ShaStorage is AccesorMod {
   using HitchensUnorderedKeySetLib for HitchensUnorderedKeySetLib.Set;
    using EnumSet for EnumSet.AddressSet;
    EnumSet.AddressSet internal MasterClassContractRegistry;
    // Set to store aura keys
    EnumSet.UintSet private auraKeys;
    struct MasterClass {
        address classAddress;
        SHIO Cow;
    }
    struct VibeStorage {
        uint64 aura;
        HitchensUnorderedKeySetLib.Set kappaReg;
        mapping(uint64 => int) vibes;
    }
    struct UserStorage {
        uint64 aura;
        int vibes;
    }

    address mafths = 0xD1CDF9d71f8752034C30893FFE9E073128225B33;

    SHIOFactory SHIOf = SHIOFactory(0x546d5151203a1454570D93f0B806eD8999cCB67B);
    uint64 public constant MotzkinPrime = 953467954114363;

    mapping(address => UserStorage) private userStorage;

    mapping(address => MasterClass) private masterContracts;
    // Nested mapping: maps aura to EnumSet of kappa values
    mapping(uint64 => VibeStorage) private AuraStorage;

    // Nested mapping: maps aura to kappa, which stores the vibes (int)
    mapping(uint64 => mapping(uint64 => int)) public vibesStorage;

    constructor(address access) AccesorMod(access) {}

    /**
     * @notice Save `vibes` into vibesStorage using two uint64 values (`aura` and `kappa`).
     * @param aura The first key in the storage.
     * @param kappa The second key in the storage.
     * @param vibes The integer value to store.
     */
    function saveToStorage(
        uint64 aura,
        uint64 kappa,
        int vibes
    ) external onlyConsul {
        // Save the vibes directly
      console.logUint(kappa);
        AuraStorage[aura].aura = aura;

        AuraStorage[aura].kappaReg.insert(kappa);
       
        AuraStorage[aura].vibes[kappa] = vibes;

    }

    /**
     * @notice Adds `vibes` into vibesStorage using two uint64 values (`aura` and `kappa`).
     * @param aura The first key in the storage.
     * @param kappa The second key in the storage.
     * @param vibes The integer value to store.
     */
    function addToStorage(
        uint64 aura,
        uint64 kappa,
        int vibes
    ) external onlyConsul {
        // Save the vibes directly
        AuraStorage[aura].aura = aura;
        if(AuraStorage[aura].kappaReg.exists(kappa)){
            AuraStorage[aura].vibes[kappa] += vibes;

        }
        else{

        AuraStorage[aura].kappaReg.insert(kappa);
        AuraStorage[aura].vibes[kappa] = vibes;
        }
    }

    function generateAura(address user) public pure returns (uint64) {
        return uint64(uint256(uint160(user))) % MotzkinPrime;
    }

    /**
     * @notice Retrieve `vibes` from storage using the two keys (`aura` and `kappa`).
     * @param aura The first key.
     * @param kappa The second key.
     * @return The stored `vibes` corresponding to the (`aura`, `kappa`) combination.
     */
    function getFromStorage(
        uint64 aura,
        uint64 kappa
    ) external view returns (int) {
        return AuraStorage[aura].vibes[kappa];
    }

    /**
     * @notice Sum the `vibes` for all values associated with a specific `aura`.
     * @param aura The `aura` key to sum vibes for.
     * @return The total sum of `vibes` for the specified `aura`.
     */
    function sumVibesForAura(
        uint64 aura,
        address user
    ) external view returns (int) {
        int totalVibes = 0;
        console.log("moppr6o");
        // Iterate through all kappa keys for the specific aura
        for (uint256 j = 0; j < AuraStorage[aura].kappaReg.count(); j++) {
            uint64 kappa = uint64(AuraStorage[aura].kappaReg.keyAtIndex(j));
           
            // Sum up the vibes for this aura
            totalVibes += AuraStorage[aura].vibes[kappa];
        }
        if (totalVibes < 5) {
            totalVibes = 5;
        }
        if (totalVibes > 9999) {
            totalVibes = 9999;
        }

        return totalVibes;
    }
}
