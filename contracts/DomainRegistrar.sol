// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.18;

import "./IDomainRegistrar.sol";
import "./Domain.sol";

//See corresponding IDomainRegistrar.sol interface for function documentation
contract DomainRegistrar is IDomainRegistrar{
    address public override deployer;
    string public override registrar_name;
    mapping(bytes32 => address) public override registry;

    constructor(string memory _registrar_name)  {
        deployer = msg.sender;
        registrar_name = _registrar_name;
    }

    function register(string memory hostname, string memory ipaddress, address publicKey, string memory extraInfo) public override returns (address) {
        //Deploy Domain.sol contract accordingly.
        bytes32 hostname_hash = keccak256(abi.encodePacked(hostname));
        require(registry[hostname_hash] == address(0), "Domain name has already been registered");

        address domain = address(new Domain(msg.sender,hostname, ipaddress, publicKey, extraInfo));
        registry[hostname_hash] = domain;
        emit domainCreated(domain);
        return domain;
    }

    function lookUp(string memory hostname) public view override returns (address){
        bytes32 hostname_hash = keccak256(abi.encodePacked(hostname)); 
        return registry[hostname_hash];
    }

    function transferOwnership(string memory hostname, address newOwner) public override{
        bytes32 hostname_hash = keccak256(abi.encodePacked(hostname)); 
        address domain = registry[hostname_hash];
        require(registry[hostname_hash] != address(0), "Domain does not exist");
        address currentOwner = IDomain(domain).owner();
        require(msg.sender == currentOwner, "You are not the current owner of the domain");
        IDomain(domain).transferOwnership(newOwner);
        emit ownershipTransfer(domain, newOwner);
    }


    function supportsInterface(bytes4 interfaceId) external view virtual override returns (bool) {
        return
            interfaceId == type(IDomainRegistrar).interfaceId ||
            interfaceId == type(IERC165).interfaceId;
    }



    

}