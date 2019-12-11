pragma solidity ^0.5.0;

import "./Token.sol";
import "./IndivisibleAsset.sol";

contract OneTimeEscrow { 

    Token public _token_;
    IndivisibleAsset public _asset_;

    address public _buyer_;
    address public _seller_;
    uint256 public _price_;

    event AssetRetrieved();
    event TokenRetrieved();
    event Settled();
    
    constructor(address payable token, address buyer,
     address asset, address seller, uint256 price) public {

        _token_ = Token(token);
        _asset_ = IndivisibleAsset(asset);

        _buyer_ = buyer;
        _seller_ = seller;
        _price_ = price;
    }

    function retrieveAsset() public returns (bool) {

        require(_asset_.getOwner() == address(this));

        _asset_.transfer(_seller_);

        emit AssetRetrieved();

        return true;
    }

    function retrieveToken() public returns (bool) {

        require(_token_.balanceOf(address(this)) >= _price_);

        _token_.transfer(_buyer_, _price_);

        emit TokenRetrieved();

        return true;
    }

    function settle() public returns (bool) {

        require(_token_.balanceOf(address(this)) >= _price_);
        require(_asset_.getOwner() == address(this));

        _token_.transfer(_seller_, _price_);
        _asset_.transfer(_buyer_);

        emit Settled();

        return true;
    }
}

/* end of OneTimeEscrow.sol */
