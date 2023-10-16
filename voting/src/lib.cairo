use starknet::ContractAddress;
use starknet::get_caller_address;
use array::ArrayTrait;


#[starknet::interface]
#[derive(Drop,Copy,Serde,starknet::Store)]
    struct Book{
        Title:felt252,
    }
    trait BookTrait{
    fn book_title_display(ref self:Book)->felt252;
    }

    impl BookTraitImpl of BookTrait{
    fn book_title_display(ref self:Book){
         self.Title;
     }
    }
trait DatabaseTrait<T> {
    fn display_books(self:@T)->Book;

    // fn add_book(ref self:T,book:Book);
}

#[starknet::contract]
mod add_book {

    use starknet::ContractAddress;
    use starknet::get_caller_address;

    use super::Book;

    trait BookTrait{
        fn book_title_display(self:Book)->felt252;
    }

    impl BookTraitImpl of BookTrait{
        fn book_title_display(self:Book)->felt252{
            self.Title
     }
    }



    //This is the structure that stores all variables i.e the various types of books
    #[storage]
    struct Storage {
        Bk:Book,
    }


    #[constructor]
    fn constructor(ref self:ContractState){
        let book1 = Book{Title:'Be Rich',};
        self.Bk.write(book1)
     }

    #[external(v0)]
    impl DatabaseTraitImp of super::DatabaseTrait<ContractState>{

        fn display_books(self:@ContractState)->Book{
            self.Bk.read()
        }
    }

}
