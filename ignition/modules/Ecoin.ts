// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const EcoinModule = buildModule("EcoinModule", (m) => {
  const ecoin = m.contract("Ecoin");

  return { ecoin };
});

export default EcoinModule;
