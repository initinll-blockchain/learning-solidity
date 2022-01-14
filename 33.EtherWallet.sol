//SPDX-Licence-Identifier: UNLICENCED"

pragma solidity 0.8.11;

/*    
    Ether Wallet - 
        - Owner can recive ether from anyone
        - but only owner can withdraw ethers from this contract wallet
*/

contract EtherWallet {
    address payable public owner;

    constructor () {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    fallback() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "Caller is not owner");

        payable(msg.sender).transfer(_amount);
        // or
        (bool sent,) = msg.sender.call{value: _amount}("");
        require(sent, "Failed to send Ether");
    }

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }
}