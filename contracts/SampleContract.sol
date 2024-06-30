// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
contract SampleContract{
    string public myString="Usman";
    //Payable is used to accept ethereum 
    function UpdateString(string memory _updateString) public payable {
        if(msg.value==1 ether){
            myString =_updateString;
        }
        else {
            payable (msg.sender).transfer(msg.value);
        }
    }


}