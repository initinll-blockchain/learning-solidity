//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
    Immutable - 
        - Innitialised only once during contract deployment
*/

contract Immutable {
    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }

    function foo() external {
        require(msg.sender == owner);
    }
}