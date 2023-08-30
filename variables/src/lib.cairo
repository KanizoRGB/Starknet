use debug::PrintTrait;
use traits::TryInto;
use option::OptionTrait;
fn main() {
    let sum = 8_u128 + 10_u128;


    let quotient = 56_u128/32_u128;

    let remainder = 43_u128%5_u128;

    remainder.print();
}