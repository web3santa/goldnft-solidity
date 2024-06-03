// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GoldNFT is ERC721URIStorage, Ownable(msg.sender) {
    using Strings for uint256;

    uint256 private _nextTokenId;
    uint256 private _tokenID;
    uint256 public mintPrice = 0.002 ether;
    string private newbaseURI;
    uint256 public totalNFT = 1000;

    constructor() ERC721("GoldNFT", "GOLD") {
        _tokenID = 1;
    }

    function mint() public payable {
        require(msg.value >= mintPrice, "Mint Price need to have more then 0.002 ether");
        require(_tokenID <= totalNFT, "Total NFT need matched");
        _safeMint(msg.sender, _tokenID);
        _tokenID++;
    }

    function setMintPrice(uint256 _mintPrice) public onlyOwner {
        mintPrice = _mintPrice;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return newbaseURI;
    }

    function setBaseURI(string memory _newbaseURI) public onlyOwner {
        newbaseURI = _newbaseURI;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireOwned(tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string.concat(baseURI, tokenId.toString(), ".json") : "";
    }

    function withraw() public onlyOwner {
        payable(msg.sender).transfer(payable(address(this)).balance);
    }
}
