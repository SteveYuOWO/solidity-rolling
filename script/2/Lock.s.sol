// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import "../../src/2/Lock.sol";

contract LockScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        new Lock{ value: 0.1 ether }(
          block.timestamp + 2 minutes
        );
        vm.stopBroadcast();
    }
}
