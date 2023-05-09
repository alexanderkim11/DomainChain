# Nethermind Ethereum Client
Nethermind is a high-performance, highly configurable full Ethereum protocol execution client built on .NET that runs on Linux, Windows, and macOS, and supports Clique, Aura, and Ethash. Nethermind offers very fast sync speeds and support for external plugins.

Note that this write-up will primarily focus on the files contained in this repository, as well as the specific steps need to compile and execute said files.  For more robust information on the Nethermind client as a whole, please see the official Nethermind repository and documentation.

[Official Nethermind Github](https://github.com/NethermindEth/nethermind)


# Setup
This section will focus on getting setup to run this system.
  ## Executables
  Due to the size of executables used by the Nethermind client, they were not included into this repository.  However, you can download them from [here](https://downloads.nethermind.io/).  The three executables you will need are <code>Nethermind.Runner</code>, <code>Nethermind.Launcher</code>, and <code>Nethermind.Cli</code>.  Once downloaded, move them into the /nethermind folder of your clone of the DomainChain repository.
  
  ## Configuration Files
  There are a number of different files in the <code>/nethermind</code> folder that provided opportunities to configure the blockchain to your individual needs.
  ### <code>chainspec.json</code>

# Contents
