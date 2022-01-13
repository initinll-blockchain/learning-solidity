//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*    
    Call - 
       - call is a low level function to interact with other contracts.
       - This is the recommended method to use when you're just sending Ether via calling the fallback function.
       - However it is not the recommend way to call existing functions.
*/

contract TestCall {
    string public message;
    uint public x;

    event Log(string message);

    fallback() external {
        emit Log("Fallback was called");
    }

    function foo(string memory _message, uint _x) external payable returns (bool, uint) {
        message = _message;
        x = _x;
        return (true, 999);
    }
}

contract Call {
    bytes public data;

    function callFoo(address _testCallAddr) external payable {
        (bool _success, bytes memory _data) = _testCallAddr.call{
            value: 111, 
            gas: 5000
        }(abi.encodeWithSignature("foo(string,uint256)", "call foo", 123));

        require(_success, "Call failed");
        data = _data;
    }

    function callDoesNotExist(address _testCallAddr) external {
        (bool _success, ) = _testCallAddr.call{
            value: 111, 
            gas: 5000
        }(abi.encodeWithSignature("doesNotExist()"));

        require(_success, "Call failed");
    }
}

