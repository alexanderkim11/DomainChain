// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.18;

import "./IERC165.sol";

interface IDomainRegistrar {
    //------------------------------------------------------------
    // The following method(s) are done automatically -- as long as
    // you make the appropriate variable public, then Solidity will create
    // the getter function for you
    
    // Mapping from the hash of hostnames to associated Domain contract addresses
    //
    // @param hostname_hash: Keccak256 hash of a hostname in string format
    // @return Contract address of Domain for a given hostname, 0x0..000 if has not been initialized
    function registry(bytes32 hostname_hash) external returns (address);

    //------------------------------------------------------------

    // Function to register a new domain name, assuming it hasn't already been taken
    //
    // @param hostname: String representation of hostname
    // @param server_ipaddress: String representation of IP address for this domain's server
    // @param publicKey: Public key for this domain (note: Ethereum address can function both as accounts and public-private key pairs)
    // @param extraInfo: String for any additional info
    // @return Address of newly initialized Domain contract
    function register(string memory hostname, string memory server_ipaddress, address publicKey, string memory extraInfo) external returns (address);

    // Function to transfer ownership of a Domain to a new account
    // Note: can only be called by current owner of Domain
    //
    // @param hostname: String representation of hostname
    // @param server_ipaddress: Account address of new owner.
    // @return True if function was successful, reverts otherwise
    function transferOwnership(string memory hostname, address newOwner) external returns (bool);


    // Helper function to look up Domain contract addresses directly from hostname strings
    // Note:  This function is needed because the mapping maps from the hash of hostnames to addresses
    //
    // @param hostname: String representation of hostname
    // @return Address of corresponding Domain contract, 0x0..000 if has not been initialized
    function lookUp(string memory hostname) external returns (address);

    //------------------------------------------------------------
    // Events to emit

    // Emitted whenever the register() function is called
    //
    // @param domain: Contract address of created domain.
    event domainCreated(address domain);

    // Emitted whenever the transferOwnership() function is called
    //
    // @param domain: Contract address of created domain.
    // @param newOwner: Address of new owner
    event ownershipTransfer(address domain, address newOwner);

    //------------------------------------------------------------

    //As specified by EIP-165 (Ethereum Improvement Proposal 165)
    function supportsInterface(bytes4 interfaceId) external view returns (bool);

}