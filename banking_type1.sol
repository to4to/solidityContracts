// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Banking{
mapping (address=>uint)public balances;
address payable owner;

constructor() {
    owner=payable (msg.sender);
}

function deposit() public payable {
require(msg.value>0,"Deposit Less than 0");
balances[msg.sender]+=msg.value;
}


function withdraw(uint amount)public {

    require(msg.sender==owner,"u Are Not Owner");
    require(amount<=balances[msg.sender],"Insufficient Funds");
    require(amount>0,"Withdraw less than 0");
    payable (msg.sender).transfer(amount);
    balances[msg.sender]-=amount;
}


function transfer(address payable recepient,uint amount )public {

    require(amount<=balances[msg.sender],"InsufficientFunds");
    require(amount>0,"Transfer Amount Should be Greater than 0");
    balances[msg.sender]-=amount;

    balances[recepient]+=amount;
}

function getBalance(address payable user)public  view returns (uint){
    return balances[user];
}

function grantAccess(address payable user) public {
    require(msg.sender==owner,"Only Owner cna grant access");
    owner=user;
}

function revokeAccess(address payable user) public {
    require(msg.sender==owner,"only user can revoke access");
    require(user!=owner,"Can't revoke access for current owner");
    owner=payable (msg.sender);
}

function destroy() public {
    require(msg.sender==owner,"Ony Owner can destroy");
    selfdestruct(owner);
}


}