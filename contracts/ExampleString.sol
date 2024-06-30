// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
contract ExampleString{
    string public str="hello World";
    bytes public myBytes="hello World";
    //Public can update state of blockchain variables
    function SetString(string memory _updateString) public {
            str =_updateString;
    }
    //view can not change state of blockchain variables
    function CompareStrings(string memory _updateString) public view returns (bool) {
        return keccak256(abi.encodePacked(str)) == keccak256(abi.encodePacked(_updateString));
    }

}