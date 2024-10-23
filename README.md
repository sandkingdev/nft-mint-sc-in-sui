# NFT-tutorial

This repository contains a Non-Fungible Token (NFT) Minting Smart Contract written for the Sui blockchain.

## 🚀 Features

- Mint NFTs with unique attributes.
- Transfer ownership of NFTs securely.
- Leverages the Sui blockchain for scalability and low-cost transactions.
- Beginner-friendly implementation for learning and experimenting.

## 🛠️ Tech Stack

- **Sui Move:** For writing and deploying smart contracts on the Sui blockchain.
- **Sui CLI:** For interacting with the Sui network and deploying the contract.
- **TypeScript (Optional):** For testing and interacting with the contract.


## 📦 Project Structure

```
|-- interaction/           # Optional scripts to interact with the contract  
|   |-- devnet.sh          # Script to deploy contract
|-- sources/               # Contains the Move source code  
|   |-- nft.move           # NFT minting and management logic  
|   |-- ownership.move     # Ownership logic
|-- tests/                 # Optional tests for the smart contract  
|-- move.toml              # Project configuration for Sui Move  
```

## 📚 How to Use

### Prerequisites

1. Install the Sui CLI.
2. Set up a Sui Wallet or test account.

### Setup

1. Clone this repository:

```
git clone https://github.com/sandkingdev/nft-mint-sc-in-sui.git
cd nft-mint-sc-in-sui 
```

2. Build the project:

```
sui move build  
```

3. Test the contract:

```
sui move test  
```

4. Deploy to the Sui blockchain:
```
sui client publish --gas-budget 1000  
```

## Minting an NFT
Once deployed, you can mint an NFT by calling the mint function in the contract. Use the Sui CLI or integrate with a frontend to interact with the contract.


## 🤝 Contributing
Feel free to fork the repository, make improvements, and submit pull requests!

## 🌟 Acknowledgements

- The Sui Move Documentation for clear guidance on Sui development.
- Open-source contributors who build the ecosystem!



```bash
    sui client call \
        --function initialize_collection \
        --module nft_mint \
        --package <package_object_id> \
        --args <owner_cap_object_id> \
        --gas-budget 50000000

    sui client call \
        --function initialize_collection \
        --module nft_mint \
        --package <package_object_id> \
        --args <collection_object_id> \
            <nft_name_vector_format> \
            <nft_description_vector_format> \
            <nft_image_url_vector_format> \
            <recipient_address> \
        --gas-budget 50000000   
```

````
    sui client call \
        --function mint_to_sender \
        --module nft_mint \
        --package 0x1fc866f447e1befbc1f64f6b0a41dba46e14826b66c89b8c1ee99dbf8f77b879 \
        --args 0xc6a871937bae50b0e3fafc8ea8bc6e99e4a70f1cb5e5d8846ba4047c28ecaeac \
        --gas-budget 50000000

    <!-- sui client call \
        --function mint_to_sender \
        --module nft_mint \
        --package 0x1fc866f447e1befbc1f64f6b0a41dba46e14826b66c89b8c1ee99dbf8f77b879 \
        --args 0xd594a588de36bc841d30ac066056bfa1aa846275fc98a8a4bbc9a19b8fe9b48e FirstNFTName1 FirstNftDescription1 https://nft_url_1 0x9681785da120c47b331e5f22a393eb39adb2e5dc856729a5c1ad3d292d35f2f3 \
        --gas-budget 50000000 -->

sui client call \
    --function mint_to_sender \
    --module nft_mint \
    --package 0x1fc866f447e1befbc1f64f6b0a41dba46e14826b66c89b8c1ee99dbf8f77b879 \
    --args 0xd594a588de36bc841d30ac066056bfa1aa846275fc98a8a4bbc9a19b8fe9b48e \
           0x46697273744e46544e616d6531 \
           0x46697273744e66744465736372697074696f6e31 \
           0x68747470733a2f2f6e66745f75726c5f31 \
           0x9681785da120c47b331e5f22a393eb39adb2e5dc856729a5c1ad3d292d35f2f3 \
    --gas-budget 50000000        

