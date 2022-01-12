//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
    Mapping
    cannot iterate or  find length
    write custom function to achive those
*/
contract IterableMapping {
    mapping(address => uint) public balances;
    mapping(address => bool) public inserted;
    address[] public keys;

    function set(address _key, uint val) external {
        balances[_key] = val;

        if(!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    function getSize() public view returns(uint) {
        return keys.length;
    }

    function first() external view returns(uint) {
        address firstAddr = keys[0];
        return balances[firstAddr];
    }

    function last() external view returns(uint) {
        address lastAddr = keys[getSize() - 1];
        return balances[lastAddr];
    }

    function get(uint _i) external view returns(uint) {
        address iAddr = keys[_i];
        return balances[iAddr];
    }
}