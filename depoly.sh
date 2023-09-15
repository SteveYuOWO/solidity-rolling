# To load the variables in the .env file
source .env

# To deploy and verify our contract
forge script script/4/HuskyArt.s.sol:HuskyArtScript \
  --rpc-url $GOERLI_RPC_URL \
  --broadcast \
  --verify \
  -vvvv
