// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyUSDC is ERC20 {
    constructor() ERC20("MyUSDC", "USDC") {
        _mint(msg.sender, 1000000 * 10**6); // 1,000,000 USDC to deployer
    }

    function decimals() public pure override returns (uint8) {
        return 6; // Match real USDC
    }
}
