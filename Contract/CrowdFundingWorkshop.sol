// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract CrowdFunding{
    // Declare balance parameter
    uint256 public balance;

    // Declare owner parameter and constructor
    address public owner;
    constructor(address creator) {
        owner = creator;
    }
    // Declare event
    event EventTxn(address sender, uint256 amount);

    // Donate function
    function donate() public payable {
        require(msg.value > 0, "Donate amount must more than 0.");
        balance += msg.value;

        emit EventTxn(msg.sender, msg.value);
    }

    // Get Fund Function
    function funding() public {
        require(owner == msg.sender, "Only owner can get fund.");
        payable(owner).transfer(balance);
        balance -= balance;
    }


    // Get Balance
    function getbBlance() public view returns(uint256) {
        return balance;
    }
}