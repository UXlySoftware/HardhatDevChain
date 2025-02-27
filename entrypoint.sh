#!/bin/bash

# start the hardhat node in a detached tmux session
tmux new -d -s hardhat npx hardhat node

# wait for the hardhat node to start
sleep 3

# deploy the scripts to the running instance
while ! npx hardhat ignition deploy ./ignition/modules/TestToken.ts --network localhost; do
  echo "Deployment failed, retrying in 3 seconds..."
  sleep 3
done

# keeps main thread of execution from exiting
tail -f /dev/null