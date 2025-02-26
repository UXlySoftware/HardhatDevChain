// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const TokenModule = buildModule("TestTokenModule", (m) => {
  // Get the owner address from the environment variable
  const owner = process.env.TARGET_ADDRESS;
  console.log("Target owner address:", owner);

  const token = m.contract("TestToken", [owner]);

  return { token };
});

export default TokenModule;
