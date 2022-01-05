//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

contract Constants {
    // Constant State Variable - does not change once initialized
    // Less execution gas cost
    address public constant MY_ADDRESS = 0x0000000000000000000000000000000000000000;
    uint public constant MY_UINT = 123;
}

contract Var {
    // Non constant State Variable - can change
    // More execution gas cost as compared to constant state variable
    address public MY_ADDRESS = 0x0000000000000000000000000000000000000000;
}