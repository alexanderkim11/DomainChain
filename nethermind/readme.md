# Nethermind Ethereum Client
Nethermind is a high-performance, highly configurable full Ethereum protocol execution client built on .NET that runs on Linux, Windows, and macOS, and supports Clique, Aura, and Ethash. Nethermind offers very fast sync speeds and support for external plugins.

Note that this write-up will primarily focus on the files contained in this repository, as well as the specific steps need to compile and execute said files.  For more robust information on the Nethermind client as a whole, please see the official Nethermind repository and documentation.

[Official Nethermind Github](https://github.com/NethermindEth/nethermind)


# Setup
This section will focus on getting setup to run this system.
  ## 1. Executables
  Due to the size of executables used by the Nethermind client, they were not included into this repository.  However, you can download them from [here](https://downloads.nethermind.io/).  The three executables you will need are <code>Nethermind.Runner</code>, <code>Nethermind.Launcher</code>, and <code>Nethermind.Cli</code>.  Once downloaded, move them into the <code>/nethermind</code> folder of your clone of the DomainChain repository.
  
  ## 2. Configuration Files
  There are a number of different files in the <code>/nethermind</code> folder that will need to be edited to configure the blockchain to your individual needs.
  ### [<code>chainspec.json</code>](genesis/chainspec.json)
  TODO
  ### [<code>config.cfg</code>](configs/config.cfg)
  TODO
  ### [<code>static-nodes.json</code>](data/static-nodes.json)
  TODO
  
  ## 3. Initialize Authority Node(s) (Optional)
  TODO
  
  ## 4. Initialize Local Node
  TODO
  
  ## 5. Attach to Local Node
  TODO

# Repository Contents
  - [<code>/configs</code>](configs): Contains the configuration file for your local node
  - [<code>/data</code>](data): Contains the static-nodes file used for static connections to known network nodes
  - <code>/database</code> (not included): Contains various stored information about the network.  The size of this folder will grow each time you sync to the network and download new information.
  - [<code>/genesis</code>](genesis): Contains the chainspec.json file, also known as the genesis file, that initialized the chain you want to connect to.
  - <code>/keystore</code> (not included): Contains all of the <code>.keystore</code> files for the accounts on your local node.
  - <code>/logs</code> (not included): Contains log files for monitoring and debugging your local node
  - [<code>/plugins</code>](plugins): Contains various plugin files needed by the Nethermind client
  
  
  
