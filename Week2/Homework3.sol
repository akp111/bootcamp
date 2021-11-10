// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.0;

contract VolcanoCoin{
    uint public totalSupply = 10000;
    address public owner;
    
    event SuppplyChanged(uint newSupply);
    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender == owner,"Not the owner");
        _;
    }
    function getTotalSupply() public view returns (uint){
        return totalSupply;
    }
    
    function increaseSuppy() public onlyOwner{
        totalSupply+=1000;
        emit SuppplyChanged(totalSupply);
    }
}
