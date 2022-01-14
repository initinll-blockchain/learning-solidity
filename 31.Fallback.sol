//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
    Fallback -
        - executes when function does not exists
        - directly send ether ETH  

    fallback() or receive() ?

        Ether is sent to contract
                   |
            is msg.data empty ?
                  / \
                yes  no
                /      \
    receive() exists?   fallback()
              /  \
            yes   no
            /       \
       receive()    fallback()
*/

contract Fallback {
    event Log(string func, address sender, uint value, bytes data);

    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable {
        emit Log("fallback", msg.sender, msg.value, "");
    }
}