// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract ExampleViewPure{
    uint public  myStorageVar;
    function GetMySotrageVar() public view returns(uint) {
       return myStorageVar;
    }
    function viewPure(uint a,uint b) public pure returns(uint){
        return a+b;
    }
}