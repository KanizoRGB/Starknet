//If statement
use debug::PrintTrait;

fn main(){
let num = 3;

if num == 5{
    'Condition was true '.print();
}
else{

    'Condition was false'.print();

}

// let mut i:usize = 0;

// loop{
//     if i > 10{
//         break;
//     }
//     if i == 5{
//         i+=1;
//         continue;
//     }
//     i.print();
//     i+=1;
// }

let mut counter = 0;


//Returning a value from a loop
let result=loop{
    if counter == 10 {
        break counter * 2;
    }

    counter +=1;
};

'The Result is'.print();
result.print();

} 