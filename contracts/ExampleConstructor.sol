// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
contract ExampleConstructor{
        address public Address;
    constructor (address newAddress){
        Address=newAddress;

    }

    function UpdateAddress() public {
        Address=msg.sender;
    }
}