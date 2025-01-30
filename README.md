# Hardhat Network Local Development Service

This repository builds a docker container that can be run as part of a local development service network. Add the resulting container to you docker compose
file and interact with it like you would a testnet or mainnet. 

You should attach the container to a shared docker network or expose port 8545.

## Building

```sh
docker build -t devchain .
```

## Running

```sh
docker run -d --rm -p 8545:8545 --name devchain devchain
```

## Contracts

The deploy script in [`entrypoint.sh`](entrypoint.sh) will use ignition to deploy a [Lock](./contracts/Lock.sol) contract at `0x5FbDB2315678afecb367f032d93F642f64180aa3`.
