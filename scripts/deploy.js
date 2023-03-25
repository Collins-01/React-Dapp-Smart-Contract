const { ethers } = require("hardhat");
// import { ethers } from "hardhat";
// require("dotenv").config({path: ".env"});
// const { CRYPTO_DEVS_NFT_CONTRACT_ADDRESS } = require("../constants");

async function main() {
  // const cryptoDevsNFTContract = CRYPTO_DEVS_NFT_CONTRACT_ADDRESS;

  const transactionsContract = await ethers.getContractFactory("Transactions");
  const deployedTransactionsContract = await transactionsContract.deploy();

  await deployedTransactionsContract.deployed();
  console.log(`Deployed Transaction Contract Address: `,deployedTransactionsContract.address)
}

main()
.then(() => process.exit(0))
.catch((error) => {
  console.error(error);
  process.exit(1);
});