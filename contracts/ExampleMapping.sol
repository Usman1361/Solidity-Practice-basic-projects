// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
contract ExampleMapping{
    mapping (uint => bool) public mappings;
    mapping (address => bool) public MyAddressMapings;
    mapping (uint => mapping (uint => bool)) public uintuintboolmapping;
    function set(uint _value) public {mappings[_value] = true;}

    function SetMyAddress() public {MyAddressMapings[msg.sender] = true;}
    function ShowMappingOnAddress() public view returns(bool){
        return(MyAddressMapings[msg.sender]);
    }
    function setUintUintBoolMapping(uint _key1,uint _key2,bool _value) public {uintuintboolmapping[_key1][_key2] = _value;}
   
    
    
}