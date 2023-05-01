// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.18;

import "./IERC165.sol";

interface IDomain is IERC165 {

    // The following six methods are done for you automatically -- as long as
    // you make the appropriate variable public, then Solidity will create
    // the getter function for you
    
    function registrar() external returns (address);

    function hostname() external returns (string memory);

    function ipaddress() external returns (string memory);

    function publicKey() external returns(bytes32);

    function owner() external returns (address);

    function extraInfo() external returns (string memory);

    function isActive() external returns (bool);

    function transferOwnership(address newOwner) external;

    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}