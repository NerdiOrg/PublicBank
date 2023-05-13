// SPDX-License-Identifier: BSD-3-Clause
pragma solidity ^0.8.1;

contract PublicBank {
    mapping (address => uint) accountBalances;
    string bankName;
    
    constructor(string memory newBankName){
        bankName = newBankName;
    }

    receive() external payable {
        deposit();
    }

    function deposit() private returns(uint){
        require(msg.value > 0, "Please do not attempt to deposit a value of 0 tokens.");
        accountBalances[msg.sender] += msg.value;
        return msg.value;
    }

    function withdraw(uint amountInWei) public returns(uint){
        require(accountBalances[msg.sender] >= amountInWei, "Withdrawal declined: Insufficient funds available in account balance.");
        accountBalances[msg.sender] -= amountInWei;
        (bool sent, ) = payable(msg.sender).call{value: amountInWei}("");
        require(sent, "There was an issue sending the requested tokens.");
        return accountBalances[msg.sender];
    }

    function withdrawAll() public returns(bool){
        uint amount = accountBalances[msg.sender]
        accountBalances[msg.sender] -= amount;
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        require(sent, "There was an issue sending the remaining tokens in your account balance.");
        return true;
    }

    function checkBalance() public view returns(uint){
        return accountBalances[msg.sender];
    }
}
