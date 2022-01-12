//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
    Parent Constructor -
        - 3 ways of calling parent constructor       
        - order of parent constructor initialization
*/
contract S {    
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract T {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// Initialization way 1
contract U is S("s"), T("t") { 

}

// Initialization way 2
contract V is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) { }
}

// Initialization way 3
contract UV is S("s"), T {
    constructor(string memory _text) T(_text) { }
}

// Order of Execution
// 1. S
// 2. T
// 3. V0
contract V0 is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) { }
}

// Order of Execution
// 1. S
// 2. T
// 3. V1
contract V1 is S, T {
    constructor(string memory _name, string memory _text) T(_text) S(_name) { }
}

// Order of Execution
// 1. T
// 2. S
// 3. V2
contract V2 is T, S {
    constructor(string memory _name, string memory _text) S(_name) T(_text) { }
}
