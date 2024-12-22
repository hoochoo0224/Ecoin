// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract Ecoin is ERC20, AccessControl {
  bytes32 public constant ADMIN = keccak256("ADMIN");
  bytes32 public constant MINTER = keccak256("MINTER");
  uint128 public constant TOTAL_SUPPLY = 60 * (10**18);

  mapping(address => uint128) public mintable_amount;

  uint128 public total_mintable_amount = TOTAL_SUPPLY;

  constructor() ERC20("Ecoin", "ECO") {
    _grantRole(ADMIN, msg.sender);
  }

  function grantRoleMinter(address _account, uint128 _amount) public onlyRole(ADMIN) {
    uint128 amount = _amount * (10**18);

    require(total_mintable_amount <= amount);
    require(total_mintable_amount-amount > 0);

    total_mintable_amount -= amount;
    mintable_amount[_account] = amount;

    _grantRole(MINTER, _account);
  }

  function mint(address to, uint128 _amount) public onlyRole(MINTER) {
    uint128 amount = _amount * (10**18);

    require(amount <= mintable_amount[to], "You have more offers than you can mint.");

    mintable_amount[to] -= amount;

    _mint(to, amount);
  }

}
