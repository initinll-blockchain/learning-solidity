//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
    Visibility -
        Private - only inside contract
        Internal - only inside contract and child contracts
        Public - inside and outside contract
        External - only from outside contract

    --------------------- 
    | A                 |
    | private pri()     |
    | internal inter()  |
    | public pub()      |   <------------ C
    | external ext()    |       pub() and ext()
    ---------------------

    --------------------- 
    | B is A            |
    | inter()           |   <------------ C
    | pub()             |         pub() and ext()
    ---------------------

*/

contract VisibilityBase {
    uint private x = 0;
    uint internal y = 0;
    uint public z = 0;

    function privateFunc() private pure { }

    function internalFunc() internal pure { }

    function publicFunc() public pure { }

    function externalFunc() external pure { }

    function examples() external view {
        x + y + z;
        privateFunc();
        internalFunc();
        publicFunc();
    }
}

contract VisibilityChild is VisibilityBase {
    function examples2() external view {
        y + z;
        internalFunc();
        publicFunc();
    }
}