// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract TestToken is ERC20, Ownable {
    constructor(address initialOwner)
        ERC20("TestToken", "TT")
        Ownable(initialOwner)
    {}

    struct Foo {
        uint128 fooUint128;
        string fooString;
        bool[] fooBoolArray;
    }

    struct Bar {
        Foo[] barFooArray;
    }

    event FooBar(
        uint128 a
    );

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function mintBatch(address[] memory to, uint256[] memory amounts) public payable onlyOwner {
        require(to.length == amounts.length, "Arrays must have the same length");

        for (uint256 i = 0; i < to.length; i++) {
            _mint(to[i], amounts[i]);
        }
    }

    function callFooBar(Foo calldata foo, Bar calldata bar) public {
        emit FooBar(foo.fooUint128);
    }

}