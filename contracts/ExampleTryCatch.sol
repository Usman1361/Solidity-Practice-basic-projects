// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
contract WillThrow{
    function aFunction() public pure{
        // require(false,"Error Message");
        assert(false);
    }


}
contract ErrorHandling{
    event ErrorLogging(string Reason);
    event ErrorCode(uint ErrorCode);
    event LowLevelData(bytes ErrorCode);
    function CatchTheError() public {
        WillThrow Throw= new WillThrow();
        try Throw.aFunction(){
            //add code here
        }
        catch Error (string memory ErrMsg) {
            //Error Reason
            emit ErrorLogging(ErrMsg);
        } catch Panic (uint ErrMsg) {
            emit ErrorCode(ErrMsg);
        } catch(bytes memory lowleveldata){
             emit LowLevelData(lowleveldata);

        }

    }
}