// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.18;

contract TransactionPermissions {
    /// Allowed transaction types mask
    uint32 constant None = 0;
    uint32 constant All = 0xffffffff;
    uint32 constant Basic = 0x01;
    uint32 constant Call = 0x02;
    uint32 constant Create = 0x04;
    uint32 constant Private = 0x08;
    mapping(address => uint32) approvedAddresses;
    address deployer;

    constructor() {
        deployer = msg.sender;
        approve(msg.sender, All);
    }

    function allowedTxTypes(address sender) public view returns (uint32)
    {
        return approvedAddresses[sender];
    }

    //Function to allow deployer of this contract to change permissions for all users
    function setPermissions(address approved, bool all, bool basic, bool call, bool create, bool priv) public {
        require(msg.sender == deployer, "Only the admin can call this function");
        if (all == true){
            approve(approved, All);
        }else{
            uint32 ret = None;
            if (basic == true){
                ret = ret | Basic;
            }
            if (call == true){
                ret = ret | Call;
            }
            if (create == true){
                ret = ret | Create;
            }
            if (priv == true){
                ret = ret | Private;
            }
            approve(approved, ret);
        }
    }

    //Internal function to add to approvedAddresses[] mapping
    function approve(address approved, uint32 permissions) internal {
        approvedAddresses[approved] = permissions;
    }
}



