import { ethers } from "hardhat";

async function main() {

  const MyAPE = await ethers.getContractFactory("MyAPE");
  const myAPE = await MyAPE.deploy();

  await myAPE.deployed();

  console.log("MyAPE NFT Contract deployed to:", myAPE.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
