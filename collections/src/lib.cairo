use array::ArrayTrait;
use debug::PrintTrait;
use option::OptionTrait;

fn main(){

    let mut a = ArrayTrait::new();

    a.append(0);
    a.append(1);
    a.append(2);
    a.append(5);

//removing  an element from an array
//    let result=a.pop_front().unwrap();

    // result.print();
    let first = *a.at(0);
    let second = *a.at(1);

    second.print();
}