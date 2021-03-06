//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
*/
contract SimpleStorage {    
    string public text;

    // aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    // calldata - 89626 gas
    // memory - 90114 gas
    function set(string calldata _text) external {
        text = _text;
    }

    function get() external view returns (string memory) {
        return text;
    }    
}