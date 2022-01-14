//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
    Payable -
        - payable receives ether or mdg.value
        - balance shows ether balance    
*/

contract Payable {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    // gets and stores ethers for this contract
    function deposit() external payable { }

    // give balance of stored ether
    function getBalance() external view returns(uint) {
        return address(this).balance;
    }
}