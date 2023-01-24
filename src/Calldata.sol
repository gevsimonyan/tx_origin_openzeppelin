// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


contract Calldata {

    function str1(string memory _srt) external pure returns(uint256 ptr){
        assembly {
            // 0x40 == 64 -> last free memory pointer
            ptr := mload(64) // 192
            // 192 - 32 --> our str variable
        }
    }   

    function str2(string memory _str) external pure returns(bytes32 data) {
        assembly {
            let ptr := mload(0x40)
            data := mload(sub(ptr, 32)) // 192 - 32
        }
    }

    function arr1(uint256[3] memory arr) external pure returns(uint256 ptr) {
        assembly {
            ptr := mload(0x40) // 224
        }
    }

    function arr2(uint256[3] memory arr) external pure returns(bytes32 data1, bytes32 data2, bytes32 data3) {
        assembly {
            let ptr := mload(0x40)
            data1 := mload(sub(ptr, 32)) // first elem 224 - 32
            data2 := mload(sub(ptr, 64)) // second elem 224 - 64
            data3 := mload(sub(ptr, 96)) // third elem 224 - 96
        }
    }

    function msgdata1(uint256[3] memory arr) external pure returns(bytes memory data){
        data = msg.data;
    }

    function msgdata2(string calldata str) external pure returns(bytes32 el1){
        assembly {
            el1 := calldataload(4) // 0x000...00020
            // 20 in hex -> 32 in dex
        }
    }

    function msgdata3(string calldata str) external pure returns(bytes32 el1){
        assembly {
            el1 := calldataload(add(4, 32)) // 0x000...0004
            // 4 is lenght of our string(bytes count, not letter count!)
        }
    }

    function msgdata4(string calldata str) external pure returns(bytes32 el1){
        assembly {
            el1 := calldataload(add(4, 64))
        }
    }

    function msgdata5(uint256[] calldata arr) external pure returns(
        bytes32 startIndex, bytes32 elCount, bytes32 el1
    ){
        assembly {
            startIndex := calldataload(4)
            elCount := calldataload(add(startIndex, 4))
            el1 := calldataload(add(startIndex, 36))
        }
    }

    function msgdata6(uint256[] calldata arr) external pure returns(bytes memory data){
        data = msg.data;
    }

}