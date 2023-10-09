use debug::PrintTrait;

use traits::Into;

use array::ArrayTrait;

#[derive(Copy, Drop)]

enum Data{
    Integer:u128,
    Felt:felt252,
    Tuple:(u128,u128),
}


fn main(){

    let mut messages:Array<Data> = ArrayTrait::new();

    messages.append(Data::Integer(100));

    messages.append(Data::Felt('Hello World'));

    messages.append(Data::Tuple((10,30)));

}