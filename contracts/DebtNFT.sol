// // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";



contract DebtNFT is ERC721URIStorage {
    uint256 public tokenCounter;
    mapping(uint256 => uint256) public debtNFT;
    string  public tokenURI;
    /// @notice constructor function will pass collection name and symbol to the parent contract that we have inherited from openzeppelin
    constructor(string memory _tokenURI) ERC721("Debt Collection", "Debt") {
        tokenCounter = 0;
        tokenURI = _tokenURI;
    }

    /// @notice An aritst can mint their NFT using this function
    function createCollectible(
        uint256 _debtNFTIdex
    ) public returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _safeMint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        debtNFT[newTokenId] = _debtNFTIdex;
        return newTokenId;
    }

    
}