// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
contract ExampleMappingWithDrawls{
    mapping(address => uint) public balances;
    function  SendMoney() public payable {
        balances[msg.sender] += msg.value;

    }
    function GetBalance() public view returns (uint) {
        return address(this).balance;
    }

    function WithDrawlAllMoney(address payable _to) public {
        uint balanceTosentOut = balances[msg.sender];
        balances[msg.sender]=0;
        _to.transfer(balanceTosentOut); 
        
    }
   
    
    
}