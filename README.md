## PublicBank
A Solidity smart contract that lets any address deposit or withdraw funds with address-based balances. Each contract is its own bank, with secure permissions as a decentralized banking solution for blockchains / cryptocurrencies (Ethereum / Solidity).

## IPFS CONFIRMATION
To help increase the decentralized nature of this project, you may identify each contract version's source code on IPFS.

CURRENT / LATEST (v0.1) - `bafkreidkevyddgu3wr3thq7fyge2cypp7zge37wcii5ngowckknxwbutme`
https://ipfs.io/ipfs/bafkreidkevyddgu3wr3thq7fyge2cypp7zge37wcii5ngowckknxwbutme


## Decentralized Banking Smart Contract
The `PublicBank` contract is a simple banking contract developed in Solidity, an object-oriented programming language for writing smart contracts on Ethereum-based blockchain platforms. It offers basic banking operations such as deposit, withdraw, and check balance.

## Prerequisites
You need to have a basic understanding of Solidity to comprehend this contract. Knowledge of Ethereum and smart contracts is also necessary. You must fully read and understand the LICENSE file found in this project's root directory. I make no guarantees or assurances as to the security, use, or application of the code or files found in this repository.

## Code Explanation

### Pragma Solidity
The line `pragma solidity ^0.8.1;` specifies the compiler version that this code is compatible with. It helps to prevent issues with future compiler versions that may have changes in the language syntax or semantics.

The `PublicBank` contract includes a mapping to hold `accountBalances` for each Ethereum address. It also defines a string variable `bankName`.

### Constructor

The `constructor` is a special function that is executed during the creation of the contract and cannot be called afterwards. The constructor sets the `bankName`. In the future this could be used to have multiple banks or departments on 1 contract.

### Receive Function

The `receive` function is a special function that is executed when a contract receives plain Ether (without data). This function is marked as `external`, meaning it can only be called from outside the contract. The function calls the `deposit` function.

### Deposit Function

The `deposit` function is a private function, which means it can only be called internally (from this contract). This function updates the `accountBalances` mapping to record the deposited amount. The `msg.value` refers to the number of wei sent with the message, so the sender can withdraw the amount later.

### Withdraw Function

The `withdraw` function allows the user to withdraw a specified amount of tokens (in wei) from their account. It checks if the account balance is sufficient for the withdrawal, sends the amount, and then updates the balance in `accountBalances`.

### WithdrawAll Function

The `withdrawAll` function allows the user to withdraw all tokens from their account. It sends the total balance of the user's account and then sets the balance in `accountBalances` to zero.

### CheckBalance Function

The `checkBalance` function allows the user to check the balance of their account. It returns the balance from the `accountBalances` mapping.
