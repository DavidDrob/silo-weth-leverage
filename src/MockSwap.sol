// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.18;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// Mock contract for swapping ezETH for wETH
contract MockSwap {
    address public constant WETH = 0x4200000000000000000000000000000000000006;
    address public constant EZ_ETH = 0x2416092f143378750bb29b79eD961ab195CcEea5;

    function swap_ezeth_for_weth(uint256 amountIn) external returns (uint256) {
        IERC20(EZ_ETH).transferFrom(msg.sender, address(this), amountIn);
        IERC20(WETH).transferFrom(address(this), msg.sender, amountIn);

        return amountIn;
    }

    function swap_weth_for_ezeth(uint256 amountIn) external returns (uint256) {
        IERC20(WETH).transferFrom(msg.sender, address(this), amountIn);
        IERC20(EZ_ETH).transfer(msg.sender, amountIn);

        return amountIn;
    }
}
