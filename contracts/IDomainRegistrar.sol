// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.18;

import "./IERC165.sol";

interface IDomainRegistrar is IERC165 {
    //------------------------------------------------------------
    
    function registry(bytes32 hostname_hash) external returns (address);

    function deployer() external returns (address);

    //------------------------------------------------------------

    function register(string memory hostname, string memory server_ipaddress, bytes32 publicKey, string memory extraInfo) external returns (address);

    function transferOwnership(string memory hostname, address newOwner) external;

    function lookUp(string memory hostname) external returns (address);

    //------------------------------------------------------------
    // Events to emit

    // Called whenever a new domain is created
    //
    // @param domain: Contract address of created domain.
    event domainCreated(address domain);

    event ownershipTransfer(address domain, address newOwner);

    //------------------------------------------------------------

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

}

// Returns true if the passed address is a member of this DAO, false
// otherwise.  This likely has to call the NFTManager, so it's not just a
// public variable.  For this assignment, this should be callable by both
// members and non-members.
//
// @param who An account address
// @return A bool as to whether the passed address is a member of this DAO