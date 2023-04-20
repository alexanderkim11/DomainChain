// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.18;

import "./IDomainRegistrar.sol";
/

contract DomainRegistrar {
    address deployer;

    constructor()  {
        deployer = msg.sender;
    }

    function register() public returns (address) {

    }
    

}