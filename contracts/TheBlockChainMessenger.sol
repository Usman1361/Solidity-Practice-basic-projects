// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
contract TheBlockChainMessenger{
    uint public counter;
    address public owner;
    string public theMessage;
    constructor(){
        owner=msg.sender;
    }
    function UpdateMessage(string memory _updateMessage) public{
        if(msg.sender==owner){
            theMessage=_updateMessage;
            counter+=1;
        }else {
            revert("You are not authorized to update this message");
        }

    }

}