//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*    
    New - 
       - Contracts can be created by other contracts using the new keyword
*/

contract Account {
    address public bank;
    address public owner;

    constructor(address _owner) payable {
        bank = msg.sender;
        owner = _owner;
    }
}

contract AccountFactory {
    Account[] public accounts;

    function createAccount(address _owner) external payable {
        Account account = new Account{value: msg.value}(_owner);
        accounts.push(account);
    }
}

