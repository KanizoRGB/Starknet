use debug::PrintTrait;

//function with no parmater
fn another_function(){
    'Another function.'.print();
}

//funtion with one parameter
fn another_function2(x:felt252){
    x.print();
}

//function with two parameters
fn another_function3(a:felt252,b:felt252){
    a.print();
    b.print();
}

//functiion with a return type specified after the arrow.
fn five() -> u8{
    5 //no semicolon as it is an expression
}

//The explicit return type is the same as of the last expression in the function
fn plus_one(k:u32)->u32{
    k + 1
}

fn main(){
    'Hello world'.print();

    another_function();

    another_function2(5);

    another_function3(1,2);

    let m = {let n = 3; n+1}; //using expressions in assignment

    m.print();

    let c =five(); //using returns of a function in assignment
    
    c.print();

    let z = plus_one(4);
    
    z.print();
}