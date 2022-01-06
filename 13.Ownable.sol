//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
    example of sample contract showing Setting and swapping ownership of contract
*/
contract Ownable {
    address public owner;
    
    constructor () {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not an owner");
        _;
    }

    modifier onlyValidAddress(address _address) {
        require(_address != address(0), "invalid address");
        _;
    }

    function setNewOwner(address _newOwner) external onlyOwner onlyValidAddress(_newOwner) {
        owner = _newOwner;
    }

    function onlyOwnerCanCallThisFunc() external onlyOwner {
        // code
    }

    function anyoneCanCallThisFunc() external {
        // code
    }
}