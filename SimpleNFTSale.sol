// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyNFT is ERC721 {
    uint256 public nextTokenId;
    constructor() ERC721("MyNFT", "MNFT") {}

    function mint(address to) external {
        _mint(to, nextTokenId);
        nextTokenId++;
    }
}
