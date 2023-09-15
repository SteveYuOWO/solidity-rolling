const ethers = require('ethers');

// Set up your Alchemy API URL and API key
const alchemyUrl = 'https://eth-goerli.g.alchemy.com/v2/<api-key>';
const provider = new ethers.JsonRpcProvider(alchemyUrl);
const wallet = new ethers.Wallet("<private-key>");
const connectedWallet = wallet.connect(provider);
const tokenAddress = '<token-address>';
const tokenAbi = ['function transfer(address to, uint256 value) returns (bool success)'];

const tokenContract = new ethers.Contract(tokenAddress, tokenAbi, connectedWallet);

const toAddress = '<receipient-address>'; // Replace with the recipient's address
const amount = ethers.parseUnits('100', 18); // Replace with the desired amount
(async () => {
  try {
    const tx = await tokenContract.transfer(toAddress, amount);
    console.log(`Transaction hash: ${tx.hash}`);
    await tx.wait();
    console.log(`Transaction confirmed in block: ${tx.blockNumber}`);
  } catch (error) {
    console.error('Error transferring tokens:', error);
  }
})();
