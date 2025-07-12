// scripts/deploy.js

const hre = require("hardhat");

async function main() {
  // Compile contracts (optional but good to include in scripts)
  await hre.run('compile');

  // Get the contract factory
  const ReportLogger = await hre.ethers.getContractFactory("ReportLogger");

  // Deploy the contract
  const reportLogger = await ReportLogger.deploy();

  // Wait for it to be deployed
  await reportLogger.waitForDeployment();

  // Get deployed address
  const address = await reportLogger.getAddress();

  console.log("✅ ReportLogger deployed to:", address);
}

// Handle errors
main().catch((error) => {
  console.error("❌ Deployment error:", error);
  process.exitCode = 1;
});
