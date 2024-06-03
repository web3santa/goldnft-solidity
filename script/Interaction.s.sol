// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {GoldNFT} from "../src/NFT.sol";

contract Interaction is Script {
    address public contractAddress = 0xDDBbdcB889eA250eC0C9331c730F13DB70F21a2c;

    function run() external {
        vm.startBroadcast();

        GoldNFT(contractAddress).withraw();

        vm.stopBroadcast();
    }
}
