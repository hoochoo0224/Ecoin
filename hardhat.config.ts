import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.20",
  networks: {
    amoy: {
      url: `https://polygon-amoy.g.alchemy.com/v2/`,
      accounts: [""],
    }
  }
};

export default config;
