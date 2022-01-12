//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/* Solidity has 3 types of variables -

    1. State Variables
        - Declared inside a contract but outside of a contract functions
        - Store data on blockchain
        
    2. Local Variables
        - Declared only inside of functions
        - The data in local variable is lost after function executes

    3. Special Variables
        - There are special variables and functions which always exist in the 
            global namespace and are mainly used to provide information about the 
            blockchain or are general-use utility functions.
        - for full list, refer https://docs.soliditylang.org/en/v0.8.11/units-and-global-variables.html
 */

contract VariablesIntro {

    // 1. State Variable
    uint public myStateVariable = 123;

    function LocalVariables() external pure {
        // 2. Local Variable
        uint myLocalVariable = 123;
    }

    function SpecialVariables() public view {
        // 3. Special Variables
        address sender = msg.sender;
        uint timestamp = block.timestamp;
        uint blockNo = block.number;
    }
}