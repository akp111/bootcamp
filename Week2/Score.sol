//SPDX-License-Identifier: UBLICENSED

pragma solidity ^0.8.0;

//contract keyword followed by the name
//{} to limit the contract
//can have multiple contract in single file
contract Score{
    
//solidity is statically typed langauage: define the type of value
//solidity accept ssigned and unsigned integers
//end with semicolumn(;)
uint score;
address owner;

//called only during deployment of contract
constructor(){
    owner = msg.sender;
}

//contracts dont much interact with dapp.so events are best for that
event NewScore(uint _newScore);


//when dealing with digital assets, we need to have additional security. we define visibility to keep functions secure
//public: wallets,other contracts, inherited contract,internal functions
//internal: visible to internal and inherited functions
//external:outside contract, not inside
//private: internal contracts only

//view: reads storage(contract state).
//pure: neither reads nor modifies state. eg. calculations
//function returnSum() public pure returns(uint){
  //return 1+2;  
//}
//pure function consumes gas but it is not payed by caller


//modifier adds added secuirty. it chekcs the condition and if it is satisfied, the state is changed
//msg.sender is a gloval variable. msg is an object that has properties
//if called from a EOA, the caller will the contract and not the user

modifier onlyOwner{
    if(msg.sender == owner){
        //it means execute reminder of the functions
        _;
    }
}
function getScore() public view returns(uint){
    
    return score;
    // return 1+2;
    
}

//setter function to modify the state
function setScore(uint _newScore)public onlyOwner {
    score = _newScore;
    emit NewScore(score);
}   

//function with view
function add() public pure returns(uint){
    return 1+2;
}

//  Trx finality in ethereum is an issue.
// trx may take some time to be mined. so in case some calls in between it may return the old value
//never have return value in function modifiying the state


//function setScore(uint _newScore)public returns(uint){
    // score = _newScore;
    //return score;
// }  
}