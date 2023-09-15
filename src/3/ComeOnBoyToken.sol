// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import {ERC20} from "openzeppelin/token/ERC20/ERC20.sol";

contract ComeOnBoyToken is ERC20 {
  constructor(string memory name, string memory symbol) ERC20(name, symbol) {
    _mint(address(this), 10 ** 10 * 10 ** 18);
  }

  function airdrop(uint256 amount) public {
    _transfer(address(this), msg.sender, amount);
  }
}
