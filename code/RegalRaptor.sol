// "SPDX-License-Identifier: MIT"

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RegalRaptor is ERC721, Ownable {
    string baseURI = "ipfs://QmRzUHxg1mYJARencGiZMZ8VX3CTCtBVVaWYmCE43xvwdo/";
    
    using Strings for uint256;
    
    constructor() ERC721('Regal Raptor Rescue Club', 'RRRC') {
        for (uint i = 0; i < 70; i++) {
            _mint(msg.sender, i);
        }
     }
 
    function _baseURI() internal view override returns(string memory) {
        return baseURI;
    }
 
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString(), '.json')) : "";
    }
    
    function contractURI() public pure returns (string memory) {
        return "ipfs://QmTEj5x1mjhUweUMMwq5oMASruf53RFBfXkXwpBCbzHa8k";
    }
    
    // First, add images. Will require reupload to IPFS and new URI. Then add metadata (same). Then run for loop to mint them one by one.
    function ownerMint(address _to, uint _tokenId) public onlyOwner() {
        _safeMint(_to, _tokenId);
    }
    
    function changeBaseURI(string calldata _newURI) public onlyOwner() {
        baseURI = _newURI;
    }
}