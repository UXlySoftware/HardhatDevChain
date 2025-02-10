// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const TokenModule = buildModule("TestTokenModule", (m) => {
  // Get the owner address from the environment variable
  const owner = process.env.TARGET_ADDRESS;
  const receiver_address = process.env.RECEIVER_ADDRESS;
  console.log("Target owner address:", owner);

  const send = m.send("SendingEth", receiver_address, 1_000_000n);

  const token = m.contract("TestToken", [owner]);

  return { token };
});

export default TokenModule;
