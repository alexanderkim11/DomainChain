// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.18;

import "./IERC165.sol";

interface IDomain is IERC165 {
    //------------------------------------------------------------
    // The following methods are done automatically -- as long as
    // you make the appropriate variable public, then Solidity will create
    // the getter function for you


    // Address of DomainRegistrar contract that initialized this Domain contract
    //
    // @return Contract address of creator DomainRegistrar
    function registrar() external returns (address);


    // Hostname of this domain
    //
    // @return Hostname of this domain in string format
    function hostname() external returns (string memory);

    // IPv4 address of this Domain's server
    //
    // @return IP Address of this Domain's server in string format
    function ipaddress() external returns (string memory);

    // Public Key of this domain used for encryption and message signing
    //
    // @return Ethereum address used as public key for this domain
    function publicKey() external returns(address);

    // Owner of this domain
    //
    // @return Ethereum address of the owner of this domain
    function owner() external returns (address);

    // Any additional information will be stored here (domain description, alternate hostnames, etc...)
    //
    // @return String of additional information
    function extraInfo() external returns (string memory);

    // Is this Domain contract currently active, or outdated?
    //
    // @return True if Domain is valid or up-to-date, false if not
    function isActive() external returns (bool);

    //------------------------------------------------------------
    // Helper Functions
    // These functions cannot be called by anyone other than the DomainRegistrar contract that
    // initialized a given Domain contract

    // Sets owner variable to new owner, only called from transferOwnership() function in DomainRegistrar
    // contract
    //
    // @param newOwner: Address of new owner
    function transferOwnership(address newOwner) external;

    //-----------------------------------------------------------

    //As specified by EIP-165 (Ethereum Improvement Proposal 165)
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}