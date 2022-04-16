// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract DLTSCBTokenV2 is Initializable, ERC20Upgradeable, ERC20BurnableUpgradeable, AccessControlUpgradeable, UUPSUpgradeable {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant UPGRADER_ROLE = keccak256("UPGRADER_ROLE");
    bytes32 public constant USER_ROLE = keccak256("USER_ROLE");
    //    bytes32 public constant INTERN_ROLE = keccak256("INTERN_ROLE");
    uint256 public count;
    string public setMessage;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() initializer {}

    function initialize() initializer public {
        __ERC20_init("DLTSCBToken", "SCB");
        __ERC20Burnable_init();
        __AccessControl_init();
        __UUPSUpgradeable_init();

        _mint(msg.sender, 1000 * 10 ** decimals());
        // _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        // _setRoleAdmin(USER_ROLE, DEFAULT_ADMIN_ROLE);
        // _setRoleAdmin(INTERN_ROLE, USER_ROLE);

        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        _grantRole(UPGRADER_ROLE, msg.sender);
        _grantRole(USER_ROLE, msg.sender);
        count = 0;
        setMessage = "V1-Reporting";
    }

   // Function that increments our counter
    function increment() public onlyRole(USER_ROLE) {
        // require(hasRole(USER_ROLE, msg.sender));
        count += 1;
    }
    function setText(string memory _setText) public {
        setMessage = _setText;
    }
      // Not necessary getter to get the count value
    function getCount() public onlyRole(USER_ROLE) view returns (uint256)  {
        return count;
    }
    // Function that increments our counter
    function decrement() public onlyRole(USER_ROLE) {
        count--;
    }
    function getText() public view returns(string memory) {
        return(setMessage);
    }
    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }


    function addUserToAdminRole (address account) public onlyRole(DEFAULT_ADMIN_ROLE) {
        grantRole(DEFAULT_ADMIN_ROLE, account);
    }

    function addUserRole (address account) public onlyRole(DEFAULT_ADMIN_ROLE) {
        grantRole(USER_ROLE, account);
    }

   function isUserRole(address account) public view returns (bool) {
        return hasRole(USER_ROLE, account);
    }
     function addMinterRole (address account) public onlyRole(DEFAULT_ADMIN_ROLE) {
        grantRole(MINTER_ROLE, account);
    }
  
    function isMinterRole(address account) public view returns (bool) {
        return hasRole(MINTER_ROLE, account);
    }
  
    function revokeUserRole (address _account) public onlyRole(DEFAULT_ADMIN_ROLE) {
        _revokeRole(USER_ROLE, _account);
    }

  
 

  
//  // Not necessary getter to get the count value restricted
//     function getCount2() public onlyRole(USER_ROLE) view returns (uint256) {
//         return count;
//     }
  
//     function decrement2() public onlyRole(USER_ROLE) {
//         count--;
//     }

    function _authorizeUpgrade(address newImplementation)
        internal
        onlyRole(UPGRADER_ROLE)
        override
    {}
}