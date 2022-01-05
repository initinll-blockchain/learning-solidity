//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
 3 types of throwing error - require, revert, assert
 gas refunds and state updates are reverted
 custom error saves gas
*/
contract Error {
    function testRequire(uint _i) public pure {
        require(_i < 10, "i > 10");
        // Require can check single condition
        // If above condition _i < 10 passess then below Code executes 
        // else error i > 10 is thrown as error
    }

    function testRevert(uint _i) public pure {
        if (_i > 10) {
            if (_i < 15) {
                revert("i > 10 && i < 15");                
            }
        } 
        // Revert is same as Require only revert can be used if multiple condition needs to be verified        
    }

    uint public num = 123;

    function testAssert() public view {
        assert(num == 123);
        // assert always check for true condition
        // if assert fails that means there is a bug in contract        
    }

    function foo() public {
        // accidently update state variable num
        // this is a bug and get caught when testAssert() is executed
        num += 1;
    }

    function bar1(uint _i) public {
        // State variable is updated
        num += 1;
        // if iis passed as 13 then the below condition fails the above state variable is reverted 
        // and the remaining gas is refunded
        // longer the error msg more the gas, so custom error saves gas
        require(_i < 10, "error msg");
    }

    error myError(address addr);
    
    function bar2(uint _i) public view {       
        // custom error only works with revert.
        if (_i > 10) {
            revert myError(msg.sender);
        }        
    }
    
}