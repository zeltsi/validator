pragma solidity ^0.4.6;

contract Validator {
    
    address owner;
    
    function Validator(){
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
        if(owner == msg.sender){
            _;
        }else{
            throw;
        }
    }

    function verify(bytes32 r, bytes32 s, uint8 v, bytes32 hash) returns(address) {
        return ecrecover(hash, v, r, s);
    } 
    
    function constVerify(bytes32 r, bytes32 s, uint8 v, bytes32 hash) constant returns(address) {
        return ecrecover(hash, v, r, s);
    } 
    
    function kill() onlyOwner {
        suicide(owner);
    }
}
