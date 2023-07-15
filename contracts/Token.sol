// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// For this project, you will write a smart contract to create your own token on a local HardHat network. Once you have your contract, 
// you should be able to use remix to interact with it. From remix, the contract owner should be able to mint tokens to a provided address. 
// Any user should be able to burn and transfer tokens.

contract Token {
    
    uint256 public totalSupply;
    mapping(address => uint256) public balances;

    address public owner;

    

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner!!!");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function mint(address _to, uint256 amount) external onlyOwner {
        require(_to != address(0), "Invalid");
        totalSupply += amount;
        balances[_to] += amount;
        
    }

    function burn(uint256 amount) external {
        require(amount > 0, "Invalid");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        totalSupply -= amount;
        balances[msg.sender] -= amount;
        
    }

    function transfer(address to, uint256 amount) external {
        require(to != address(0), "Invalid address");
        require(amount > 0, "Invalid");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        
    }
}