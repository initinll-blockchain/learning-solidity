//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
    Array - Dynamic or fixed
    Initialization
    Insert (push), get, update, delete, pop, length
    Creating array in memory
    Returning array from function   
    bigger the array more gas it would use 
*/
contract Array {
    uint[] public nums = [1, 2, 3];
    uint[3] public numsFixed = [4, 5, 6];

    function example() external {
        nums.push(4); // [1, 2, 3, 4]
        uint x = nums[1];
        nums[2] = 777; // [1, 2, 777, 4]
        delete nums[1]; // [1, 0, 777, 4]
        nums.pop(); // [1, 0, 777]
        uint len = nums.length;

        // create array in memory - push and pop not available
        uint[] memory a = new uint[](5);
        a[1] = 123;
    }

    function returnArray() external view returns(uint[] memory) {
        return nums;
    }

    // [1, 2, 3] -- removeByShit(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- removeByShit(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    // [1] -- removeByShit(0)
    uint[] public arr;
    function removeByShit(uint _index) public {
        require(_index < arr.length, "index out of bound");

        for (uint index = _index; index < arr.length; index++) {
            arr[index] = arr[index + 1];
        }
        arr.pop();
    }
    // [1, 2, 3] -- removeBySwap(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- removeBySwap(2) --> [1, 2, 6, 4, 5, 6] --> [1, 2, 6, 4, 5]    
    function removeBySwap(uint _index) public {
        arr[_index] = arr[_index - 1];
        arr.pop();
    }
}