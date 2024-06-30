// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract HelloWorld {
  /**
   * @dev Prints Hello World string
   */
   string public onString = "Hello World on Earth";
   function updateOurString(string memory _updateString) public {
    onString=_updateString;
   }
  // function print() public pure returns (string memory) {
  //   return "Hello World!";
  // }
}
