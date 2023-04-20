pragma solidity ^0.8.17;

contract test {
    /// Allowed transaction types mask
    uint32 constant None = 0;
    uint32 constant All = 0xffffffff;
    uint32 constant Basic = 0x01;
    uint32 constant Call = 0x02;
    uint32 constant Create = 0x04;

    function tester() public view returns (uint32){
        return None | Basic ;
    }
    function test2() public view returns (uint){
        return 1;
    }
}