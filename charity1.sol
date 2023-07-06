

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
    function donate() external payable {
        require(msg.value > 0, "Donation amount must be greater than 0.");
        balances[msg.sender] += msg.value;
        emit DonationReceived(msg.sender, msg.value);
    }

}