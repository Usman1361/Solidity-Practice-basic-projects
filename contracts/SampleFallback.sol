// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
contract SampleFallback{
    uint public lastSentValue;
    string public LastFunctionCalled;

    receive() external payable {
        lastSentValue=msg.value;
        LastFunctionCalled="Recieved";
     }
    
    fallback() external payable  {
        lastSentValue=msg.value;
        LastFunctionCalled="FallBack";
     }


}