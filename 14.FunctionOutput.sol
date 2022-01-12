//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
    Return multiple outputs
    Named outputs
    Destructuring assignmrnts
*/
contract FunctionOutput {
    function returnMany() public pure returns (uint, bool) {
        return (1, true);
    }

    function named() public pure returns (uint _x, bool _b) {
        return (1, true);
    }

    function assigned() public pure returns (uint _x, bool _b) {
        _x = 1;
        _b = true;
    }

    function destructingAssignments() public pure {
        (uint x, bool b) = returnMany();
        (, bool c) = named();
    }
}