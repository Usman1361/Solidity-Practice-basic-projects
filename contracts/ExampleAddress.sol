// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract ExampleAddress{
    address public Address;

    function ChangeAddress(address _newAddress) public {
        Address=_newAddress;
    }
    function GetAddressBalance() public view returns(uint){
        return Address.balance;
    }
}