// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyERC20 is ERC20("MyToken", "MT"), Ownable {

    function transfer(address to, uint256 amount) public override returns(bool) {

    }

    function burn(address from, uint256 amount) public onlyOwner {
        _burn(from, amount);
    }



}