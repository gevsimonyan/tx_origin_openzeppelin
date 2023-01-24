// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract TxOrigin {
    function printAddresses() public view {
        console.log("TxOrigin contract. Tx origin  is: ", tx.origin);
        console.log("TxOrigin contract. Msg sender is: ", msg.sender);
    }
}

contract CallTxOrigin {
    function _callTxOrigin(TxOrigin _contract) public view {
        console.log("CallTxOrigin contract. address(this) is: ", address(this));
        _contract.printAddresses();
    }
}