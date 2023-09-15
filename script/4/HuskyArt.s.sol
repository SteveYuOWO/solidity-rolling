// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import "../../src/4/HuskyArt.sol";

contract HuskyArtScript is Script {
  function setUp() public { }
  
  function run() public {
      uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
      vm.startBroadcast(deployerPrivateKey);
      new HuskyArt();
      vm.stopBroadcast();
  }
}
