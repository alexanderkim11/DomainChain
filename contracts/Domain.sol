// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.18;

import "./IDomain.sol";

contract Domain is IDomain {

    // The following six methods are done for you automatically -- as long as
    // you make the appropriate variable public, then Solidity will create
    // the getter function for you

    address public override registrar;
    string public override hostname;
    string public override ipaddress;
    bytes32 public override publicKey;
    address public override owner;
    string public override extraInfo;
    bool public override isActive;

    constructor(address _owner, string memory _hostname, string memory _ipaddress, address _publicKey, string memory _extraInfo){
        registrar = msg.sender;
        hostname = _hostname;
        ipaddress = _ipaddress;
        publicKey = _publicKey;
        owner = _owner;
        extraInfo = _extraInfo;
        isActive = true;
    }

    function transferOwnership(address newOwner) public override{
        require(msg.sender == registrar, "Only the domain registrar contract can call this function");
        owner = newOwner;
    }

    function supportsInterface(bytes4 interfaceId) external view virtual override returns (bool) {
        return
            interfaceId == type(IDomain).interfaceId ||
            interfaceId == type(IERC165).interfaceId;
    }
}