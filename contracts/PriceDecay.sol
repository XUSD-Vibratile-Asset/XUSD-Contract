// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {FixedPointMathLib} from "./FixedPointMathLib.sol"; // Import fixed-point math library

contract PriceSlowDecay {
    using FixedPointMathLib for uint256;

    uint256 public immutable initialPrice;  // Initial high price
    uint256 public immutable minPrice;      // Minimum price after full decay
    uint256 public immutable startTime;     // Time when decay starts
    uint256 public immutable duration;      // Duration in seconds over which the price decays

    /**
     * @dev Constructor to initialize the decay parameters.
     * @param _initialPrice The starting price, must be higher than `_minPrice`.
     * @param _minPrice The minimum price after full decay.
     * @param _duration Duration in days over which the decay occurs.
     */
    constructor(uint256 _initialPrice, uint256 _minPrice, uint256 _duration) {
        require(_initialPrice > _minPrice, "Initial price must be greater than minimum price.");
        require(_duration > 0, "Duration must be greater than 0.");
        
        initialPrice = _initialPrice;
        minPrice = _minPrice;
        duration = _duration * 86400; // Correctly convert duration from days to seconds
        startTime = block.timestamp;  // Start time of decay
    }

    /**
     * @notice Returns the current price based on the time elapsed.
     * @dev Implements a quadratic decay function: (1 - (elapsedTime / duration)^2).
     *      The price decays smoothly from `initialPrice` to `minPrice` over `duration`.
     *      Uses FixedPointMathLib for precise arithmetic operations.
     * @return The current price of the asset based on the decay curve.
     */
    function getCurrentPrice() public view returns (uint256) {
        // Calculate the elapsed time since the decay started
        uint256 elapsedTime = block.timestamp - startTime;

        // Return minimum price if the decay has completed
        if (elapsedTime >= duration) {
            return minPrice;
        }

        // Calculate time factor as a scaled fraction of the duration, using WAD precision (18 decimals)
        uint256 timeFactor = elapsedTime.divWadDown(duration);  // timeFactor = elapsedTime / duration
        uint256 decayFactor = 1e18 - timeFactor.mulWadDown(timeFactor); // Decay factor: (1 - (t/d)^2)

        // Compute the decayed price
        uint256 priceRange = initialPrice - minPrice;
        uint256 decayedAmount = priceRange.mulWadDown(decayFactor);  // priceRange * decayFactor

        // Return the current price
        return minPrice + decayedAmount;
    }
}
