// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyAPE is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;

    /// @dev Base token URI used as a prefix by tokenURI().
    string public baseTokenURI;

    constructor() ERC721("MYAPE", "APE") {
        baseTokenURI = "";
    }
    
    function mintTo(address recipient)
        public
        returns (uint256)
    {
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _safeMint(recipient, newItemId);
        return newItemId;
    }

    /// @dev Returns an baseURI 
    function _baseURI() internal view virtual override returns (string memory) {
      return baseTokenURI;
    }

    /// @dev Sets the base token URI prefix.
    function setBaseTokenURI(string memory _baseTokenURI) public {
      baseTokenURI = _baseTokenURI;
    }
}
