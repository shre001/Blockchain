// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";
contract FundMe {
    using SafeMathChainlink for uint256;
    address public owner;
    
    constructor () public{
        owner=msg.sender;
    } 
    
    mapping(address =>uint256) public addressToAmoundFunded;
    function fund() public  payable {
        uint256 minimumUSD=1*10**18;
        require(getCoversionRate(msg.value)>=minimumUSD, "You need to spend more eth");
        addressToAmoundFunded[msg.sender] += msg.value;
        //what the ETH -> USD conversion rate
        
    }
    
    function withdraw() payable public{
        require(msg.sender == owner);
        msg.sender.transfer(address(this).balance);
    }
    function getVersion() public view returns(uint256){
        AggregatorV3Interface priceFeed =AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }
    
    function getPrice() public view returns(uint256){
        AggregatorV3Interface priceFeed =AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
         (,int price,,,) = priceFeed.latestRoundData();
        return uint256(price*1000000000);
    }
    
    function getCoversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice =getPrice();
        uint256 ethAmountInUsd =(ethPrice *ethAmount)/1000000000000000000;
        return ethAmountInUsd;
        
    }
}