// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {GoldNFT} from "../src/NFT.sol";

contract DeployNFT is Script {
    function run() external returns (address) {
        vm.startBroadcast();

        GoldNFT nft = new GoldNFT();
        nft.setBaseURI("ipfs://QmWeGVX8Uo6PopZE1z89dwXUJ1hcpeJQzjRanMARM5xLLE/");

        vm.stopBroadcast();

        return address(nft);
    }
}
