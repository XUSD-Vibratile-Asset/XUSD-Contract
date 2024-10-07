// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
 * @title IShaStorage
 * @dev Interface for the ShaStorage contract that defines functions for saving, retrieving, summing vibes, etc.
 */
interface IShaStorage {
    
    // Struct declaration to represent a StorageUnit.
    struct StorageUnit {
   
        int vibes;
    }


    function saveToStorage(uint64 aura, uint64 kappa,  int vibes) external;


  function addToStorage(uint64 aura, uint64 kappa, int vibes) external;
    /**
     * @notice Remove the storage entry for a specific (`aura`, `kappa`) combination.
     * @param aura The first key.
     * @param kappa The second key.
     * @return Whether the entry was removed (`true` if it existed and was removed, `false` otherwise).
     */
    function getFromStorage(uint64 aura, uint64 kappa) external view returns (int);

    /**
     * @notice Sum the `vibes` for all `StorageUnit` objects associated with a specific `aura`.
     * @param aura The `aura` key to sum vibes for.
     * @return The total sum of `vibes` for the specified `aura`.
     */
    function sumVibesForAura(uint64 aura, address user) external view returns (int);
 function processFirst(address[] memory arrayAddresses) external;
}
