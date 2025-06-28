// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC721 {
    function safeTransferFrom(address from, address to, uint256 tokenId) external;
    function ownerOf(uint256 tokenId) external view returns (address);
}

interface IERC20 {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract SimpleNFTSale {
    address public nft;
    address public usdc;
    uint256 public price = 100 * 10**6; // 100 USDC (6 decimals)

    event Received(address sender, uint256 amount);

    constructor(address _nft, address _usdc) {
        nft = _nft;
        usdc = _usdc;
    }

    function sell(address buyer, uint256 tokenId) external {
        require(IERC721(nft).ownerOf(tokenId) == msg.sender, "Not owner");
        require(IERC20(usdc).transferFrom(buyer, msg.sender, price), "USDC failed");
        IERC721(nft).safeTransferFrom(msg.sender, buyer, tokenId);
    }

    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
}
