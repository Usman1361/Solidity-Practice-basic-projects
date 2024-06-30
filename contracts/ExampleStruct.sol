// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Wallet{
    PaymentReceived public Payment;
    function PayContract() public payable {
        Payment=new PaymentReceived(msg.sender,msg.value); 
    }


}

contract PaymentReceived{
    address public from;
    uint public amount;

    constructor(address _from,uint _amount){
        from=_from;
        amount=_amount;
    }
}

contract Wallet2{
    struct PaymentReceivedStruct{
        address from;
        uint amount;

    }
        PaymentReceivedStruct public Payment;
    function PayContract() public payable {
        // Payment=PaymentReceivedStruct(msg.sender,msg.value); 
        Payment.from = msg.sender;
        Payment.amount=msg.value;

    }

}