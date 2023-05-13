## PublicBank
A Solidity smart contract that lets any address deposit or withdraw funds from their account balance, using the contract as 1 shared pool. Clear permissions and decentralized banking for blockchains / cryptocurrencies (Ethereum / Solidity).

## IPFS CONFIRMATION
To help increase the decentralized nature of this project, you may identify each contract version's source code on IPFS.

CURRENT / LATEST (v0.1) - `bafkreidkevyddgu3wr3thq7fyge2cypp7zge37wcii5ngowckknxwbutme`
https://ipfs.io/ipfs/bafkreidkevyddgu3wr3thq7fyge2cypp7zge37wcii5ngowckknxwbutme


## Decentralized Banking Smart Contract
The `PublicBank` contract is a simple banking contract developed in Solidity, an object-oriented programming language for writing smart contracts on Ethereum-based blockchain platforms. It offers basic banking operations such as deposit, withdraw, and check balance.

## Prerequisites
You need to have a basic understanding of Solidity to comprehend this contract. Knowledge of Ethereum and smart contracts is also necessary.

## Code Explanation

### Pragma Solidity
The line `pragma solidity ^0.8.1;` specifies the compiler version that this code is compatible with. It helps to prevent issues with future compiler versions that may have changes in the language syntax or semantics.

The `PublicBank` contract includes a mapping to hold `accountBalances` for each Ethereum address. It also defines a string variable `bankName`.

### Constructor

The `constructor` is a special function that is executed during the creation of the contract and cannot be called afterwards. It is payable, which means it can receive Ether. The constructor sets the `bankName` and calls the `deposit` function.

### Receive Function

The `receive` function is a special function that is executed when a contract receives plain Ether (without data). This function is marked as `external`, meaning it can only be called from outside the contract. The function calls the `deposit` function.

### Deposit Function

The `deposit` function is a private function, which means it can only be called internally (from this contract). This function updates the `accountBalances` mapping to record the deposited amount. The `msg.value` keyword refers to the number of wei sent with the message.

### Withdraw Function

The `withdraw` function allows the user to withdraw a specified amount of Ether from their account. It checks if the account balance is sufficient for the withdrawal, sends the amount, and then updates the balance in `accountBalances`.

### WithdrawAll Function

The `withdrawAll` function allows the user to withdraw all Ether from their account. It sends the total balance of the user's account and then sets the balance in `accountBalances` to zero.

### CheckBalance Function

The `checkBalance` function allows the user to check the balance of their account. It returns the balance from the `accountBalances` mapping.
