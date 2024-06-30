// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
contract SendMoneyExample{
    uint public balancedRecieved;
    function Deposit() public payable {
        balancedRecieved +=msg.value;
    }
    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }
    function WithDrawAll() public  {
        address payable to = payable (msg.sender);
        to.transfer(getContractBalance());

    }
    function WithDrawToAddress(address payable to) public {
        to.transfer(getContractBalance());
    }
}