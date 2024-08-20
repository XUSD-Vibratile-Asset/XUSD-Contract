// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "./ITaxCalculator.sol";

/**
 * @title BalanceBasedTaxCalculator
 * @dev A tax calculator that imposes a tax rate based on the balance of the account.
 */
contract BalanceBasedTaxCalculator is ITaxCalculator {
    int public immutable lowBalanceRateBasisPoints;
    int public immutable highBalanceRateBasisPoints;
    uint256 public immutable balanceThreshold;
    address public token;

    /**
     * @dev Constructor to set the tax rates and balance threshold.
     * @param _lowBalanceRateBasisPoints The tax rate for low-balance accounts in basis points.
     * @param _highBalanceRateBasisPoints The tax rate for high-balance accounts in basis points.
     * @param _balanceThreshold The threshold for high-balance accounts.
     */
    constructor(
        int _lowBalanceRateBasisPoints,
        int _highBalanceRateBasisPoints,
        uint256 _balanceThreshold,
        address _token
    ) {
        lowBalanceRateBasisPoints = _lowBalanceRateBasisPoints;
        highBalanceRateBasisPoints = _highBalanceRateBasisPoints;
        balanceThreshold = _balanceThreshold;
        token = _token;
    }

    function calculateTotalBasisFee(address addy, uint amount) external view override returns (int) {
        uint256 balance = IERC20(token).balanceOf(addy);
        if (balance >= balanceThreshold) {
            return highBalanceRateBasisPoints;
        } else {
            return lowBalanceRateBasisPoints;
        }
    }
}