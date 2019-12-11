pragma solidity ^0.5.0;

contract IndivisibleAsset { 

    string public _name_;
    string public _symbol_;
    uint256 public _quantity_;
    address public _owner_;

    event Transfer(address indexed from, address indexed to);
    
    constructor(string memory name, string memory symbol,
            uint256 quantity) public {

        _name_ = name;
        _symbol_ = symbol;
        _quantity_ = quantity;

        _owner_ = msg.sender;
    }

    function getOwner() public view returns (address) {
        return (_owner_);
    }

    function transfer(address to) public returns (bool) {

        require(_owner_ == msg.sender);
        
        _owner_ = to;
        
        emit Transfer(msg.sender, to);

        return true;
    }
}

/* end of IndivisibleAsset.sol */
