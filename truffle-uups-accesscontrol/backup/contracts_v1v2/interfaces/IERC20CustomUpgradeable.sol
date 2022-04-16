// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "@openzeppelin/contracts-upgradeable/interfaces/IERC20Upgradeable.sol";

interface IERC20CustomUpgradeable is IERC20Upgradeable {
    function initialize() external;

    function increment() external;
    function decrement() external;
    function getCount() external;
    function setText(string memory _setText) external;
    function getText() external;
    // function setURI(string memory newuri) external;
}
