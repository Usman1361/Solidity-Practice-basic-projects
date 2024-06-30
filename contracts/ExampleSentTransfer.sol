// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
contract Sender{
    receive() external payable { }
    function WithdrawTransfer(address payable _to) public{
        _to.transfer(10);
    }
    function WithdrawSend(address payable _to) public {
        bool isSent=_to.send(10);
        require(isSent,"Sending Does not Successful");
    }

}

contract ReceiverNoAction{
    function Balance() public view returns(uint){
        return address(this).balance;
    }
    receive() external payable { }


}

contract RecieverAction{
    uint public balanceReceived;

    receive() external payable {
        balanceReceived += msg.value;
    }

    function Balance() public view returns(uint){
        return address(this).balance;
    }


}