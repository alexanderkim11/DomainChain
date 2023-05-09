# Description
This folder contains the various Solidity interfaces used in DomainChain, as well as some sample contract implementations of those interfaces.

# Contents
- ## Interfaces
  - [**IDomainRegistrar.sol**](IDomainRegistrar.sol): Template for the repository that maps hostnames to associated Domain contracts
  - [**IDomain.sol**](IDomain.sol): Template for an individual domain contract
- ## Contract Implementations
  - [**DomainRegistrar.sol**](DomainRegistrar.sol): Implementation of the IDomainRegistrar interface
  - [**Domain.sol**](Domain.sol): Implementation of the IDomain interface
- ## Miscellaneous Files
  - [**TxPermissions.sol**](TxPermissions.sol): Permissioning contract used by the Authority Round consensus protocol to regulate which accounts and contracts can publish transactions
  - [**IERC165.sol**](Domain.sol):  Implementation of EIP-165, as outlined [here](https://eips.ethereum.org/EIPS/eip-165)


