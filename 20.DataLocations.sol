//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
    DataLocations - 
        - storage (permamnent blockchain storage), 
        - memory (temp storage) and 
        - calldata (used in function inputs)
            - saves gas
            - is readonly values cant be modified inside functions
            - paases values without making copy hence saves gas
*/
contract DataLocations {    
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function example(uint[] calldata y,string memory x) external returns(uint[] memory) {
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        MyStruct memory readOnly = myStructs[msg.sender];
        myStruct.foo = 456;

        // saves gas by avoiding copying
        _internal(y);

        uint[] memory memAdrr = new uint[](3);
        memAdrr[0] = 123;
        return memAdrr;
    }

    function _internal(uint[] calldata y) private {
        uint x = y[0];
    }
}