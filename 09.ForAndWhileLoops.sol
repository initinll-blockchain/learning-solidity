//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

contract ForAndWhileLoops {

    function loops() external pure {
        for (uint i = 0; i < 10; i++) {
            if (i == 3) {
                continue;
            }
            if (i == 5) {
                break;
            }
        }

        uint z = 0;
        while (z < 10) {
            z++;
        }
    }
}