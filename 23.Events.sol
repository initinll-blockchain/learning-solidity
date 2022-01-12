//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
    Events -
        - one way comunication to outside entity (outside of blockchain)
        - cannot be read by smart contract but only dapps
        - filter events by using indexed fields (litle gas expensive but cheaper than storage variable)
        - max 3 index allowed
*/
contract Events {    
    event Log(string _message, uint val);
    event IndexedLog(address indexed sender, uint val);

    function example() external {
        emit Log("foo", 1234);
        emit IndexedLog(msg.sender, 122);
    }

    event Message(address indexed _from, address indexed _to, string message);

    function sendMessage(address _from, address _to, string calldata message) external {
        emit Message(_from, _to, message);
    }
}