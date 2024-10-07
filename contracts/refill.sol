
// SPDX-License-Identifier: MIT
// This contract, VibeRegistry, is responsible for managing user vibes, class structures, and reward distribution in a decentralized environment. 
// It utilizes access control for secure operations and maintains various mappings and data structures for user profiles, classes, and trades. 
// The contract allows for the addition and removal of classes, calculates vibes based on user interactions, and implements reward mechanisms through registered contracts.

pragma solidity ^0.8.26;
import "./AccessControl/AccessorMod.sol";

import "./XUSD.sol";



/**
 * @title VibeRegistry
 * @dev This contract manages user vibes, class structures, and reward distribution through multiple registries.
 * Access control is handled via the inherited AccesorMod, providing restrictions on key operations.
 */
contract RewardsFiller is AccesorMod {
  address immutable xusd = 0xbbeA78397d4d4590882EFcc4820f03074aB2AB29;
  address staking = 0xa5255A4E00d4e2762EA7e9e1Dc4Ecf68b981e760;
  constructor(address access) AccesorMod(access){


  }

  function refilGenesis(uint amount) external onlyPreatormaximus{

    XUSD(xusd).mint(staking, amount);


  }

}