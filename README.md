# Erc1155
## install
forge install Cyfrin/foundry-devops --no-commit
forge install OpenZeppelin/openzeppelin-foundry-upgrades --no-commit
## Step
1. deploy the proxy contract
forge create --rpc-url https://eth-sepolia.g.alchemy.com/v2/lCvj75OmaOo8Bst8BOwDlv4mGyX1LYea --private-key bc174d4a0716ac3c7fd9d46d60a23380c22cd32b7e59eaa976e7322a7257765d src/DeployContract.s.sol:DeployContract --etherscan-api-key "X6WQUSM2BK97F9UZNNKVX7BSRZHWAKAS55" --verify

forge create --rpc-url https://eth-sepolia.g.alchemy.com/v2/lCvj75OmaOo8Bst8BOwDlv4mGyX1LYea --private-key bc174d4a0716ac3c7fd9d46d60a23380c22cd32b7e59eaa976e7322a7257765d src/UpgradeContract.s.sol:UpgradeContract --etherscan-api-key "X6WQUSM2BK97F9UZNNKVX7BSRZHWAKAS55" --verify