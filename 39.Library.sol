//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*    
    Library - 
       - Libraries are similar to contracts, but you can't declare any state variable and you can't send ether.
       - A library is embedded into the contract if all library functions are internal.
       - Otherwise the library must be deployed and then linked before the contract is deployed.
       - you can manipulate contract state variable from calling library functions       
*/

library Math {
    function max(uint x, uint y) internal pure returns (uint) {
        return x > y ? x : y;
    }
}

contract Test {
    function testMax(uint x, uint y) external pure returns (uint){
        return Math.max(x, y);
    }
}

library ArrayLib {
    function find(uint[] storage arr, uint x) internal view returns (int) {
        for (uint index = 0; index < arr.length; index++) {
            if(arr[index] == x) {
                return int(index);
            }
        }
        return -1;
    }
}

contract TestArray {
    using ArrayLib for uint[];    
    uint[] public arr = [1,2,3];

    function testFind() external view returns (int){
        //return ArrayLib.find(arr, 2);
        return arr.find(2);
    }
}

