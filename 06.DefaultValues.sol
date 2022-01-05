//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

contract DefaultValues {
    bool public b; // Default value - false
    uint public x; // Default value - 0
    int public y; // Default value - 0
    address public addr; // Default value - 0x0000000000000000000000000000000000000000 (40zeros)
    bytes32 public b32; // Default value - 0xc000000000000000000000000000000000000000000000000000000000000000 (64zeros)
}