//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
    Multiple Inheritance - 
        - Order of Inheritance Base to derived        
*/
contract A {    
    function foo() public pure virtual returns (string memory) {
        return "A";
    }

    function bar() public pure virtual returns (string memory) {
        return "A";
    }

    function Taz() public pure returns (string memory) {
        return "A";
    }
}

contract B is A {
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }

    function bar() public pure virtual override returns (string memory) {
        return "B";
    }

    function jaz() public pure returns (string memory) {
        return "B";
    }
}

contract C is A, B {  
    function foo() public pure override(A, B) returns (string memory) {
        return "B";
    }

    function bar() public pure override(B, A) returns (string memory) {
        return "C";
    }
}