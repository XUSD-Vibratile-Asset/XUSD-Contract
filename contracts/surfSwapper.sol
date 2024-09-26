// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.24;


import "./Ownable.sol";
import "./IERC20.sol";
import "./IUniswapROuter02.sol";
import "./IV2Pool.sol";

interface IVibeRegs {
    function viewVibes(address user) external view returns (int);
}


contract SurfRouterV1 is Ownable {

    uint taxRate = 5;
    address onematesWallet = 0x0FDb56674B7A3d8FD3FB45Ad4c92e98ced1fC90B;
         uint256 private locked = 1;

    modifier nonReentrant() virtual {
        require(locked == 1, "REENTRANCY");

        locked = 2;

        _;

        locked = 1;
    }
    constructor(address _owner) {
        Ownable(_owner);
    }


    function swapV2(
        address _router,
      address[] calldata path, 
        uint256 amountIn,
        uint slipage,
        address to
    ) external {
        // Get the initial balance before transfer
        uint256 initialBalance = IERC20(path[0]).balanceOf(address(this));

        // Transfer tokens from the user to the contract
        IERC20(path[0]).transferFrom(msg.sender, address(this), amountIn);

        // Calculate the actual amount received by the contract
        uint256 finalBalance = IERC20(path[0]).balanceOf(address(this));
        uint256 actualAmountIn = finalBalance - initialBalance;
        IERC20(path[0]).approve(_router, 999999999999999999999999999999999999);
        uint fee = calcFee(actualAmountIn);
       IERC20(path[0]).transfer(onematesWallet, fee);
        actualAmountIn = actualAmountIn - fee;
               uint[] memory amounts = IUniswapV2Router02(_router).getAmountsOut(actualAmountIn, path);
       uint slip = amounts[1] * (slipage * 100) /10000;
        uint realSlip = amounts[1] - slip;
     
        IUniswapV2Router02(_router).swapExactTokensForTokensSupportingFeeOnTransferTokens(actualAmountIn, realSlip, path, to, 9999999999999999999999999999999);
        // Perform the swap using the actual amount received (after tax deduction)
        //uint256 amountOut = exactInputV2(actualAmountIn, _tokenIn, _tokenOut, IV2Pool(_pool), to);

    }

    function calcFee(uint amountIn) internal view returns (uint) {
        uint feeAmount = (amountIn * (taxRate)) / (10000);        
        return feeAmount;
    }

    function recoverTokens(address _token) external onlyOwner {
        uint256 balance = IERC20(_token).balanceOf(address(this));
        IERC20(_token).transfer(msg.sender, balance);
    }

    function recoverETH() external onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    function WETHBalance() external view returns (uint256 balance) {
        return IERC20(0xA1077a294dDE1B09bB078844df40758a5D0f9a27).balanceOf(address(this));
    }
}
