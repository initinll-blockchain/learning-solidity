//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
    View Function - is a readonly function which reads state variables but do not modify it
    Pure Function - does not read state variable
*/

contract ViewAndPureFunctions {
    uint public num;

    // View function - reads state variable num
    function viewFunc() external view returns (uint) {
        return num;
    }

    // Pure function - does not read any state variable
    function pureFunc() external pure returns (uint) {
        return 1;
    }

    // View function - again reads state variable num
    function addToNum(uint x) external view returns (uint) {
        return num + x;
    }

    // Pure function - does not read any state variable
    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }
}