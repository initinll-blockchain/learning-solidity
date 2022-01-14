//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*
    Send Eth -
        - 3 ways to send ETH
        - 1. address.transfer(amount) - Sends 2300 gas & reverts on failure
        - 2. address.send(amount) - Sends 2300 gas & returns bool
        - 3. address.call.value(amount)( ) - Sends all gas, returns bool and data (recommended)
*/

contract SendEther {
   function sendViaTransfer(address payable _to) external payable {
       // This function is no longer recommended for sending Ether.
       _to.transfer(msg.value);
   }

   function sendViaSend(address payable _to) external payable {
       // Send returns a boolean value indicating success or failure.
       // This function is not recommended for sending Ether.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
   }

   function sendViaCall(address payable _to) external payable {
       // Call returns a boolean value indicating success or failure.
       // This is the current recommended method to use.
       (bool sent, bytes memory data) = _to.call{value: msg.value}("");
       require(sent, "Failed to send Ether");
   }
}

contract ReceiveEther {
    constructor() payable {}

    // Function to receive Ether. msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

