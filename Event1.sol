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

 function buyTicket(uint _id,uint quantity) external payable{
   require(events[_id].date!=0,"Event does not exist");
   require(events[_id].date>block.timestamp,"Event has already occured");
   Events storage _event = events[id];
   require(msg.value==(_event.price*quantity),"Ethere is not enough");
   require(_event.ticketRemain>=quantity,"Not enough tickets");
   _event.ticketRemain-=quantity;
   tickets[msg.sender][id]+=quantity;


 }
function transferTicket(uint _id,uint _quantity,address to)public 

}
