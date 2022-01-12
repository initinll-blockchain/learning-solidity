//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
 Function modifier - reuse code before and/ or after function
 eg - Basic, inputs, sandwich
*/
contract FunctionModifier {
    bool public paused;
    uint public count;

    function setPause(bool _paused) external {
        paused = _paused;
    }

    modifier whenNotPaused() {
        require(!paused, "Paused");
        _;
    }

    // Modifier - whenNotPaused
    function inc() external whenNotPaused {
        count += 1;
    }

    // Modifier - whenNotPaused
    function dec() external whenNotPaused {
        count -= 1;
    }

    modifier cap(uint _x) {
        require(_x < 100, "x >= 100");
        _;
    }

    // Modifier - whenNotPaused, cap(_x)
    function inBy(uint _x) external whenNotPaused cap(_x) {
        count += _x;
    }

    modifier sandwich() {
        count += 10;
        _;
        count *=2;
    }

    // Modifier - whenNotPaused, cap(_x)
    function foo() external sandwich {
        count += 1;
    }
}