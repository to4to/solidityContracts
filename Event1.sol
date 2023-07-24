// SPDX-License-Identifier: MIT


pragma solidity 0.8.20
contract Event {
    struct Event {
        address organiser;
        string name;
        uint256 date;
        uint256 price;
        uint256 ticketCount;
        uint256 ticketRemain;
    }

mapping (uint=>Event)public events;

mapping (address=>mapping (uint=>uint)) public tickets;






}
