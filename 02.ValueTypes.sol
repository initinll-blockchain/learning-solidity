//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

contract ValueTypes {
    bool public b = true;

    // uint8   0 to 2**8 - 1
    // uint16  0 to 2**16 - 1
    // uint256 0 to 2**256 - 1
    uint public u = 123;

    // uint128   -2**127 to 2**127 - 1
    // uint256   -2**255 to 2**255 - 1
    int public i = -123;

    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bytes32 b32 = 0x7465737400000000000000000000000000000000000000000000000000000000;
}