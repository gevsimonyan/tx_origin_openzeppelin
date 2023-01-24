// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";
import "../src/TxOriginExample.sol";
import "../src/Calldata.sol";


contract CounterTest is Test {
    Counter public counter;
    TxOrigin public example;
    CallTxOrigin public callTxOrigin;
    Calldata public _calldata;

    uint256[] public __arr;

    function setUp() public {
        example = new TxOrigin();
        callTxOrigin = new CallTxOrigin();
        _calldata = new Calldata();
    }

    function testTxOriginExample() public {
        console.log("Call CallTxOrigin:");
        console.log("=========================");
        callTxOrigin._callTxOrigin(example);
        console.log("=========================");
    }

    function xtestCalldata() public {
    
        console.log("=========================");
        console.log(_calldata.str1("Hello!"));
        console.log("=========================");

        console.log("=========================");
        console.logBytes32(_calldata.str2("Hello!"));
        console.log("=========================");

        uint256 a = 1;
        uint256 b = 2;
        uint256 c = 3;


        console.log("=========================");
        console.log(_calldata.arr1([a, b, c]));
        console.log("=========================");

        console.log("=========================");
        bytes32 data1;
        bytes32 data2;
        bytes32 data3;
        (data1, data2, data3) = _calldata.arr2([a, b, c]);
        console.logBytes32(data1);
        console.logBytes32(data2);
        console.logBytes32(data3);

        console.log("=========================");

        console.log("=========================");
        console2.logBytes(_calldata.msgdata1([a, b, c]));
        console.log("=========================");


        console.log("=========================");
        console.logBytes32(_calldata.msgdata2("Test"));
        console.log("=========================");


        console.log("=========================");
        console.logBytes32(_calldata.msgdata3("Test"));
        console.log("=========================");


        console.log("=========================");
        console.logBytes32(_calldata.msgdata4("Test"));
        console.log("=========================");

    
    }

    function xtestTrace() public {

        __arr.push(1);
        __arr.push(2);
        __arr.push(3);



        console.log("=========================");
        console2.logBytes(_calldata.msgdata6(__arr));
        console.log("=========================");
    }
}

