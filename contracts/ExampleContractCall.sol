// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
contract ContractOne{
    mapping (address=> uint) public addressBalances;
    function Deposit() public payable{
        addressBalances[msg.sender]+= msg.value;
    }

}

contract ContractTwo{
    receive() external payable { }

    function DepositOnContractOne(address _ContractOne) public {
        ContractOne contractone = ContractOne(_ContractOne);
        
        contractone.Deposit{value:10}();

    }
}