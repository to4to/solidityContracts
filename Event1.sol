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


    function createEvent(
        string memory _name,
        uint256 _date,
        uint256 _price,
        uint256 _ticketCount
    ) public {
require(_ticketCount>0,"Not Enough Tickets");
require(_date>block.timestamp,"Check Time");
events[id] = Events(
            msg.sender,
            _name,
            _date,
            _price,
            _ticketCount,
            _ticketCount
        );
        id++;
    }

function buyTicket(uint _id,uint _quantity)external payable {

      require(_quantity>0,"Check Quantity");
      Events storage eve=events[_id];
      require(events[_id].date>0,"Event does not exist");
      require(events[_id].date>block.timestamp,"Event Expired");
      require();

          

    }


}
