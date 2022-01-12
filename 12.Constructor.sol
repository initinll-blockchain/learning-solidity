//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
    Constructor - special function that are only called once when the contract is deployed
    mainly used to initialise state variables
*/
contract Constructor {
    address public owner;
    uint public x;

    constructor (uint _x) {
        owner = msg.sender;
        x = _x;
    }
}