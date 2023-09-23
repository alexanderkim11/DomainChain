# DomainChain
Ethereum-based alternative for Domain Name Service (DNS), built on Nethermind

# Description
This is a project for CS 6501: Network Security and Privacy in Spring 2022 at the University of Virginia.

Currently, the foremost solution for mapping hostnames to server IP addresses is the Domain
Name System, or DNS. While the usage of DNS is ubiquitous across global internet networks, it
does have several weaknesses. The distributed and hierarchical collection of servers that make
up DNS often expose potential attack vectors at the level of the local resolvers, such as cache
poisoning attacks. Specifically, the “time to live” (TTL) field of cached DNS entries combined
with the lack of authentication for responses to DNS resolver queries create significant potential
vulnerabilities in such a trusted and foundational system of the Internet. However, removing the
TTL functionality would necessitate resolvers keeping track of all cached entries permanently,
which is expensive. Adding an effective form of authentication to current DNS infrastructure
would be similarly expensive and time-consuming for others to adopt.

With the usage of a blockchain, Ethereum Name Service (ENS) gains an advantage over DNS with its
cryptographically-secure backend, which prevents retroactive changes to the network and
requires private-key signatures in order to update current records or provide new information.
However, the weakness of ENS comes from its implementation directly onto the main Ethereum
L1 network. The domain and resolver smart contracts that make up the ENS infrastructure
comprise only a tiny fraction of the larger Ethereum network, and running an Ethereum node
with the intention of having a local copy of ENS records necessitates downloading the entire
Ethereum blockchain, which is currently several hundred gigabytes of space.

Our project attempts to build upon the foundations that ENS set by developing an L2-scaling
solution on top of the current Ethereum network. In essence, our solution provides a unique
blockchain, built on-top of existing Ethereum infrastructure, that exclusively supports registrar
and domain smart contracts. In addition, our solution supports a functionality that is not
supported by ENS or by the larger default Ethereum network: permissioning. With
permissioning, our network maintains a whitelist of accounts and smart contracts that are
allowed to publish new information (transactions, contract interactions, queries, etc.) to the
network. Fundamentally, we want to develop a naming system that runs on the Ethereum
blockchain that is distributed, open, and extendable. To accomplish these goals, we propose
DomainChain.


# Contents
- [/contracts](contracts): Contains all Solidity contracts used to implement and regulate DomainChain.  See folder for more details
- [/nethermind](nethermind): Contains most files (except executables) needed to run an Ethereum node from the Nethermind client.  See folder for more details.

# Setup
- Nethermind Node: See [here](nethermind/readme.md)
- Remix: Not necessary, but the standard IDE for all Solidity contracts [(Website)](https://remix-project.org/)


