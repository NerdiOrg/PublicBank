// SPDX-License-Identifier: BSD-3-Clause
pragma solidity ^0.8.1;
// TO-DO: what is pragma solidity and version number for? 

contract PublicBank {
    mapping (address => uint) accountBalances;
    string bankName;
    
    constructor(string memory newBankName) payable{
        bankName = newBankName;
        deposit();
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
        (bool sent, ) = payable(msg.sender).call{value: amountInWei}("");
        require(sent, "There was an issue sending the requested tokens.");
        accountBalances[msg.sender] -= amountInWei;
        return accountBalances[msg.sender];
    }

    function withdrawAll() public returns(bool){
        (bool sent, ) = payable(msg.sender).call{value: accountBalances[msg.sender]}("");
        require(sent, "There was an issue sending the remaining tokens in your account balance.");
        accountBalances[msg.sender] = 0;
        return true;
    }

    function checkBalance() public view returns(uint){
        // require(accountBalances[msg.sender], "This account either does not exist or currently has a balance of 0 tokens.");
        return accountBalances[msg.sender];
    }
}
