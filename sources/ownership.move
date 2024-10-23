module nft_tutorial::ownership {
    use sui::event;

    public struct OwnerCap has key {
        id: UID,
    }

    public struct OperatorCap has key {
        id: UID,
    }

    /// OwnerCapTransferred event
    public struct OwnerCapTransferredEvent has copy, drop {
        from: address,
        to: address
    }

    /// OperatorCapTransferred event
    public struct OperatorCapTransferredEvent has copy, drop {
        from: address,
        to: address
    }

    fun init(ctx: &mut TxContext) {
        // initialize admin cap and transfer to publisher
        transfer::transfer(OwnerCap {
            id: object::new(ctx),
        }, tx_context::sender(ctx));

        // initialize operator cap and transfer to publisher
        transfer::transfer(OperatorCap {
            id: object::new(ctx),
        }, tx_context::sender(ctx));
    }

    public entry fun transfer_ownercap(cap: OwnerCap, to: address, ctx: &mut TxContext) {
        transfer::transfer(cap, to);
        event::emit(OwnerCapTransferredEvent {
            from: sui::tx_context::sender(ctx),
            to,
        });
    }

    public entry fun transfer_operatorcap(cap: OperatorCap, to: address, ctx: &mut TxContext) {
        transfer::transfer(cap, to);
        event::emit(OperatorCapTransferredEvent {
            from: sui::tx_context::sender(ctx),
            to,
        });
    }
    
    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(ctx)
    }
}