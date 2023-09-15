# To load the variables in the .env file
source .env

# To deploy and verify our contract
forge script script/3/Transfer.s.sol:TransferScript \
  --rpc-url $GOERLI_RPC_URL \
  --broadcast \
  --verify \
  -vvvv
