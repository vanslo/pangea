// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/payment/PullPayment.sol";

contract TangibleItems is ERC721, PullPayment {
    
    uint256 public _tokenIds;
    uint256 public _itemIds;
    mapping(uint256 => Item) private _items;

    constructor() ERC721("TangibleItems", "TGI") public {
    }

    modifier itemExists(uint256 id) {
        require(_items[id].exists, "Not Found");
        _;
    }

    struct Item {
        address seller;
        uint256 price;
        string tokenURI;
        bool exists;
    }

    function addItem(uint256 price, string memory tokenURI) public {
        require(price > 0, "Price cannot be 0");

        _itemIds++;
        _items[_itemIds] = Item(msg.sender, price, tokenURI, true);
    }

    function getItem(uint256 id) public view itemExists(id) returns(uint256, uint256, string memory) {
        Item memory item = _items[id];
        return(id, item.price, item.tokenURI);
    }

    function purchaseItem(uint256 itemId) external payable itemExists(itemId) {
        Item storage item = _items[itemId];

        require(msg.value >= item.price, "Your bid is too low");

        _tokenIds++;

        _safeMint(msg.sender, _tokenIds);
        _setTokenURI(_tokenIds, item.tokenURI);
        _asyncTransfer(item.seller, msg.value);
    }

    function getPayments() external {
        withdrawPayments(msg.sender);
    }

}
