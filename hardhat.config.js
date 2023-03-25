require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config({
  path: '.env'
})

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9",
  defaultNetwork: 'goerli',
  networks : {
    'goerli': {
      url: 'https://rpc.ankr.com/eth_goerli',
      accounts: [process.env.WALLET_PRIVATE_KEY]
    }
  }
};
