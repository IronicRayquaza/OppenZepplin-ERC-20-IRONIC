async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);

    // Get the contract factory
    const MyToken = await ethers.getContractFactory("MyToken");

    // Deploy the contract, passing the initial owner address (deployer)
    const myToken = await MyToken.deploy(deployer.address);

    // Wait for the deployment to complete
    await myToken.waitForDeployment();

    console.log("MyToken deployed to:", myToken.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
