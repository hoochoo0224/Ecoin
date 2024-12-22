import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.20",
  networks: {
    amoy: {
      url: `https://polygon-amoy.g.alchemy.com/v2/0q3wLj-txnVrtrV8BTix_yYTgB3l3va3`,
      accounts: ["b9c42440da896b010607d0c9b5d0059851f8fa6548513a5dd2008d6de79c4f38"],
    }
  }
};

export default config;
