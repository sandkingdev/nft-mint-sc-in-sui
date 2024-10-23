module nft_tutorial::nft_mint {
    use std::string::{String, utf8};
    use sui::url::{Self, Url};
    use sui::object::{new};
    use sui::event;
    use nft_tutorial::ownership::{OwnerCap};

    const MAX_SUPPLY: u64 = 100;

    public struct Collection has key, store {
        id: UID,
        total_minted: u64,
    }

    public struct TestnetNFT has key, store {
        id: UID,
        name: String,
        description: String,
        url: Url,
    }

    // events
    public struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: String,
    }

    // initialize collection
    public entry fun initialize_collection(
        _owner_cap: &OwnerCap,
        ctx: &mut TxContext
    ) {
        let pool = Collection {
            id: object::new(ctx),
            total_minted: 0,
        };

        // Share the collection object with the network
        transfer::share_object(pool);
    }

    public fun mint_to_sender(
        collection: &mut Collection,
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        assert!(collection.total_minted < MAX_SUPPLY, 0);

        let sender = ctx.sender();
        let nft = TestnetNFT {
            id: new(ctx),
            name: utf8(name),
            description: utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };

        collection.total_minted = collection.total_minted + 1;

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, recipient);
    }
}
