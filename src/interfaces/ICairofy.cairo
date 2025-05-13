use cairofy_contract::structs::Structs::{Song, User, UserSubscription};
use starknet::ContractAddress;

#[starknet::interface]
pub trait ICairofy<TContractState> {
    fn register_song(
        ref self: TContractState,
        name: felt252,
        ipfs_hash: felt252,
        preview_ipfs_hash: felt252,
        price: u256,
    ) -> u64;
    fn get_song_info(self: @TContractState, song_id: u64) -> Song;
    fn update_song_price(ref self: TContractState, song_id: u64, new_price: u256);
    fn get_preview(self: @TContractState, song_id: u64) -> felt252;
    fn buy_song(ref self: TContractState, song_id: u64) -> felt252;
    fn subscribe(ref self: TContractState) -> u64;
    fn get_user_subscription(self: @TContractState, user: ContractAddress) -> UserSubscription;
    fn get_user(self: @TContractState, caller: ContractAddress) -> User;
    fn get_subscription_count(self: @TContractState) -> u64;
    fn set_song_for_sale(ref self: TContractState, song_id: u64);
    fn update_subscription_details(
        ref self: TContractState, user: ContractAddress,
    ) -> UserSubscription;
    fn stream_song(ref self: TContractState, song_id: u64) -> felt252;
    fn get_all_songs(self: @TContractState) -> Array<Song>;
    fn update_user(ref self: TContractState, caller: ContractAddress) -> User;
    // fn purchase_song(ref self: TContractState, song_id: u64)-> bool;
    fn get_user_songs(self: @TContractState, user: ContractAddress) -> Array<u64>;
    fn is_song_owner(self: @TContractState, song_id: u64) -> bool;
}
