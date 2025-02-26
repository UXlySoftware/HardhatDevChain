# Hardhat Network Local Development Service

This repository builds a docker container that can be run as part of a local development service network. Add the resulting container to your docker compose file and interact with it like you would a testnet or mainnet. 

You should attach the container to a shared docker network or expose port 8545.

## Building

```sh
docker build -t devchain .
```

This will product a self-contained docker image named `devchain` that will serve as the basis of you local development network.

## Running

```sh
docker run -d --rm -p 8545:8545 --name devchain devchain
```

Now you can interact with a virtual EVM network at [`127.0.0.1:8545`](http://127.0.0.1:8545).

## Contracts

On startup, the deploy script in [`entrypoint.sh`](entrypoint.sh) will use ignition to deploy an [ERC20](./contracts/TestToken.sol) contract at `0x5FbDB2315678afecb367f032d93F642f64180aa3`. The owner address of the token can be set via the environment variable `TARGET_ADDRESS`, like this:

```sh
docker run -d --rm -p 8545:8545 --name devchain -e TARGET_ADDRESS=0xE936e8FAf4A5655469182A49a505055B71C17604 devchain
```

The hardhat network is running in a tmux session named `hardhat`. You can see the logs in the tmux sessions by running:

```sh
docker exec devchain tmux capture-pane -t hardhat -p
```

## Testnet Addresses

The TestToken contract has been deployed to public testnets. 

```
npx hardhat set var INFURA_API_KEY
npx hardhat set var PRIVATE_KEY
npx hardhat set var ETHERSCAN_API_KEY
npx hardhat ignition deploy ./ignition/modules/TestnetDeploy.ts --network <testnetwork>
npx hardhat ignition verify chain-<chainId> --include-unrelated-contracts
```

### Fuji

Deployed at [`0x42f395431D0952269b50860ba24BeaB1442D19F0`](https://testnet.snowtrace.io/token/0x42f395431D0952269b50860ba24BeaB1442D19F0?chainid=43113)

### Sepolia

Deployed at [`0x17Ed2c50596E1C74175F905918dEd2d2042b87f3`](https://sepolia.etherscan.io/address/0x17Ed2c50596E1C74175F905918dEd2d2042b87f3)