# DomainChain
An Ethereum-based alternative for Domain Name Service (DNS), built using Nethermind

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


# Implementation:

### Nethermind:
   
For this project, we chose to implement a private blockchain with only a few nodes connected
for proof-of-concept purposes. There are several different clients that are available to connect
to the Ethereum mainnet as well as any subnets or private networks. The most commonly used
is Go-Ethereum, also known as Geth, which is provided by the Ethereum foundation. However,
as mentioned above, Geth does not currently support any consensus protocols that allow for
network permissioning, which was a key focus of our project. Consequently, we chose to use
an alternative client called Nethermind. Nethermind supports both private networks, as well as
the Authority Round (AuRa), a proof-of-authority (PoA) consensus algorithm that uses a
designated smart contract to grant permissions to users/programs on the network.
Traditionally, most blockchains use either proof-of-work (PoW) or proof-of-stake (PoS)
consensus algorithms. However, as we were only attempting to provide a small-scale
implementation of our idea, we chose to have a singular, trusted authority node on the network
by way of the PoA algorithm. This node, which was running on a CS department server,
instantly verified transactions on the network as they were published, provided that the publisher
had the correct permissions in the permissioning smart contract. It is worth noting that although
our solution used a PoA consensus algorithm, it was simply for convenience. Our idea could
easily be used with an alternative PoW or PoS algorithm, assuming that the algorithm also
supported network permissioning.
The permissioning smart contract initializes a mapping between addresses and their
corresponding allowed transaction types. Addresses in this case refers to both user accounts
and smart contracts. However, altering this mapping (and consequently the permissioning of
the network) requires an administrative account, which is set to the deployer of the
permissioning contract. Ideally, this deployer/admin would be an account managed by ICANN
or some other known and trusted authority.

### Domain Registrar:
   
We define a domain registrar interface and use a smart contract to implement the name system.
The contract keeps a mapping between the hash of the domain name and the address of the
corresponding Domain contract, which contains the actual domain information. The lookUp
function is used to query the registry and return the address of a registered domain by its name.
The transferOwnership function transfers ownership of a domain from the current owner to a
new owner, as long as the caller is the current owner.

### Domains:
  
Individual Domain contracts contain a suite of information about that domain, which the creator
provides as the time of initialization. Currently, that information includes things like the
hostname, the IP address of the associated server, the name of the domain owner, and the
public key of the domain needed for encryption. Note that the publicKey field is implemented as
an Ethereum address, which is currently sent as the account address of the user who creates
the domain. This works because the account which creates the domain is also a public key, and
the user who creates it necessarily has access to the private key because they need it to sign
and publish transactions. Domain contracts also contain a transferOwnership function, in case
the owner of a domain wishes to transfer it to another person (or one of their alternate
accounts).



# Contents
- [/contracts](contracts): Contains all Solidity contracts used to implement and regulate DomainChain.  See folder for more details
- [/nethermind](nethermind): Contains most files (except executables) needed to run an Ethereum node from the Nethermind client.  See folder for more details.

# Setup
- Nethermind Node: See [here](nethermind/readme.md)
- Remix: Not necessary, but the standard IDE for all Solidity contracts [(Website)](https://remix-project.org/)


