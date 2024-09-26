// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface IVibeRegistry {

    // Events
    event ClassAdded(address indexed classAddress, uint classType);
    event ClassRemoved(address indexed classAddress, uint classType);
    event ClassDeactivated(address indexed classAddress, uint classType);
    event ClassLimitUpdated(uint newLimit);
    event VibesCalculated(address indexed user, int vibes);
    event VibeUserDeactivated(address indexed user, address classAddress);
    event VibeUserActivated(address indexed user, address classAddress);
    event RewardsCalculated(address indexed classAddress, bytes reason);
    event WhitelistedContractAdded(address indexed contractAddress);
    event MasterClassVibesUpdated(address indexed classAddress, int vibes);
    event MasterClassErrorLogged(address indexed classAddress, uint Omnicron);
    event RewardsCalculationFailed(address indexed classHash, bytes reason);

    // Function to set class limit
    function setClassLimit(uint limit) external;

    // Function to add a class to the registry
    function addClass(address class, uint classType, bool process) external;

    // Function to deactivate a class
    function deactivateVibe(address class, uint classType) external;

    // Function to calculate vibes and sum basis
    function calculateAndSumBasis(
        address to,
        address from,
        address _caller,
        address sender,
        uint amount
    ) external returns (int, uint);

    // Function to view a user's vibes
    function viewVibes(address user) external view returns (int);

    // Function to calculate the current total vibe of a user
    function calculateCurrentVibe(address user) external view returns (int);

    // Function to set a contract as whitelisted
    function setWhitelistedContract(address contractWhite) external;

    // Function to deactivate a user's vibe for a specific class
    function deactivateVibeUser(address user, address class) external;

    // Function to reactivate a user's vibe for a specific class
    function activateVibeUser(address user, address class) external;

    // Function to log errors for a specific class
    function logMasterClassError(address class, uint Omnicron) external;
}
