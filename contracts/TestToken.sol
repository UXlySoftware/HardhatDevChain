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

    uint128[] public normalArray;
    uint128[][] public nestedArray;
    uint128[2] public fixedArray;
    uint128[][2] public nestedFixedArray;

    struct Foo {
        uint128 fooUint128;
        string fooString;
        bool[] fooBoolArray;
    }

    struct Bar {
        Foo[] barFooArray;
    }

    event CalledFooBar(
        uint128 a,
        uint128 b
    );

    event CalledCrazyArray(
        uint128 a,
        uint128 b
    );

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

    function mintBatch(address[] memory to, uint256[] memory amounts) public payable onlyOwner {
        require(to.length == amounts.length, "Arrays must have the same length");

        for (uint256 i = 0; i < to.length; i++) {
            _mint(to[i], amounts[i]);
        }
    }

    function callFooBar(Foo calldata foo, Bar calldata bar) public {
        emit CalledFooBar(foo.fooUint128, bar.barFooArray[0].fooUint128);
    }

    function crazyArray(uint128[][2] memory thing) external {
        emit CalledCrazyArray(thing[0][0], thing[1][1]);
    }

}