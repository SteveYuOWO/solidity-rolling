// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Lock {
  uint public unlockTime;
  address payable public owner;

  event Withdrawal(uint amount, uint when);

  constructor(uint _unlockTime) payable {
    require(
      block.timestamp < unlockTime,
      "Unlock time should be in the future"
    );
    unlockTime = _unlockTime;
    owner = payable(msg.sender);
  }

  function deposit() public payable {
    require(msg.value == 0.1 ether, "please send 0.1 ether");
  }

  function withdraw() public {
    require(block.timestamp >= unlockTime, "You can't withdraw yet");
    require(msg.sender == owner, "You aren't the owner");

    emit Withdrawal(address(this).balance, block.timestamp);

    owner.transfer(address(this).balance);
  }
}
