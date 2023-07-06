

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.18;

contract Charity {
    address public owner;
    mapping(address => uint256) public balances;
    event DonationReceived(address indexed donor, uint256 amount);

    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        _;
    }

}