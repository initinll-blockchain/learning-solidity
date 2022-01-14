//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*    
    Delegate Call - 
       - delegatecall is a low level function similar to call.
       - When contract A executes delegatecall to contract B, B's code is excuted
       - with contract A's storage, msg.sender and msg.value.
       - all state variables have to be same type and also in same order
       - you can add append new state variable
*/

// NOTE: Deploy this contract first
contract B {
    // NOTE: storage layout must be the same as contract A
    uint public num;
    address public sender;
    uint public value;
    address public owner;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num) public payable {
        // A's storage is set, B is not modified.
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}

