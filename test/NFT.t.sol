// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {GoldNFT} from "../src/NFT.sol";
import {Test, console} from "forge-std/Test.sol";

contract TestNFT is Test {
    uint256 testNumber;
    address alice = makeAddr("alice");
    address bob = makeAddr("bob");
    GoldNFT nft;

    function setUp() public {
        vm.startBroadcast(alice);
        nft = new GoldNFT();

        vm.deal(alice, 10 ether);
        vm.deal(bob, 2 ether);
        vm.stopBroadcast();
    }

    function test_widthrawByOtherUser() public {
        vm.startPrank(bob);

        uint256 beforeBalance = bob.balance;
        console.log(beforeBalance);

        for (uint256 i = 1; i <= 3; i++) {
            nft.mint{value: 0.002 ether}();
        }

        uint256 afterBala = bob.balance;
        console.log(afterBala);

        vm.expectRevert();
        nft.withraw();

        // uint256 afterWidrawBalance = alice.balance;
        // console.log(afterWidrawBalance);

        vm.stopPrank();
    }

    function test_Withdraw() public {
        vm.startPrank(alice);

        uint256 beforeBalance = alice.balance;
        console.log(beforeBalance);

        for (uint256 i = 1; i <= 3; i++) {
            nft.mint{value: 0.002 ether}();
        }

        uint256 afterBala = alice.balance;
        console.log(afterBala);

        nft.withraw();

        uint256 afterWidrawBalance = alice.balance;
        console.log(afterWidrawBalance);

        vm.stopPrank();
    }

    function test_Mint() public {
        vm.startPrank(alice);
        for (uint256 i = 1; i <= 1000; i++) {
            nft.mint{value: 0.002 ether}();
        }

        uint256 nftBalance = nft.balanceOf(alice);

        console.log(nftBalance);
        vm.stopPrank();
    }

    function test_NFTNAME() public view {
        string memory nftName = nft.name();
        console.log(nftName);
    }
}
