#!/bin/bash

# start the hardhat node in a detached tmux session
tmux new -d -s hardhat npx hardhat node

# wait for the hardhat node to start
sleep 3

# deploy the scripts to the running instance
npx hardhat ignition deploy ./ignition/modules/TestToken.ts --network localhost

# keeps main thread of execution from exiting
tail -f /dev/null