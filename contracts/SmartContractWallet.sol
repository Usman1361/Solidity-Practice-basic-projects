// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
contract Consumer{
    
    function GetBalance() public view returns(uint){
        return address(this).balance;
    }
    function Deposit() public payable {

    }

}
contract SmartContractWallet{
    address payable public  owner;
    mapping (address => uint) public allownce;
    mapping (address => bool) public isAllowedToSent;
    mapping (address => bool )public isGuardian;
    address payable nextOwner;
    mapping (address => mapping (address=>bool))public nextOwnerGuardianVotedBool;
    uint guardiansResetCount;
    uint public constant confirmationFromGuardianForReset=3;

    constructor ()  {
        owner=payable (msg.sender);
    }
    //FallBack Function
    receive() external payable { }
    function purposeNewOwner(address payable  _newOwner) public {
        require(isGuardian[msg.sender],"You are not a Guardian,Aborting!");
        require(nextOwnerGuardianVotedBool[_newOwner][msg.sender]==false,"You already Voted");
        if(_newOwner != nextOwner){
            nextOwner=_newOwner;
            guardiansResetCount=0;

        }
        guardiansResetCount++;
        if(guardiansResetCount>=confirmationFromGuardianForReset){
            owner=nextOwner;
            nextOwner=payable(address(0));
        }
        if(guardiansResetCount>=confirmationFromGuardianForReset){
            isGuardian[nextOwner]=false;
        }


    }
    function SetAllownce(address  _for,uint _amount) public {
        require(msg.sender == owner,"you are not Owner");
        allownce[_for]=_amount;
        if(_amount>0){
            isAllowedToSent[_for]=true;


        }
        else{
            isAllowedToSent[_for]=false;
        }
    }
    function SetGuardian(address _guardian,bool _isGuardian) public {
        require(msg.sender == owner,"you are not Owner");
        isGuardian[_guardian]=_isGuardian;
     }
    function Transfer(address payable  _to,uint _amount,bytes memory _payload) public payable returns(bytes memory) {
        // require(owner== msg.sender,"not owned");
        if(msg.sender != owner){
            require(allownce[msg.sender]>=_amount,"You are trying to send more amount than you have to!");
            require(isAllowedToSent[msg.sender],"You are not allowed to send");
            allownce[msg.sender]-=_amount;

        }
        // require(_amount<msg.value,"insufficient balance");

        // require(address(_to)!=address(0),"invalid address");
         (bool success,bytes memory returnData)=_to.call{value:_amount}(_payload);
         require(success,"transfer failed");
         return  returnData;

    }
}