use starknet::ContractAddress;
use starknet::get_caller_address;
use array::ArrayTrait;


#[starknet::interface]
#[derive(Drop,Copy,Serde,starknet::Store)]
    struct Book{
        Title:felt252,
    }
trait DatabaseTrait<T> {
    fn display_books(self: @T);
    // fn add_book(ref self:T,book:Book);
}

#[starknet::contract]
mod add_book {

    use starknet::ContractAddress;
    use starknet::get_caller_address;

    use super::Book;

    trait BookTrait{
        fn book_title_display(ref self:Book)->felt252;
    }

    impl BookTraitImpl of BookTrait{
        fn book_title_display(ref self:Book)->felt252{
            self.Title
     }
    }



    //This is the structure that stores all variables i.e the various types of books
    #[storage]
    struct Storage {
        Bk:Array<Book>,
    }


    #[constructor]
    fn constructor(ref self:ContractState){
        let book1 = Book{Title:'Be Rich',};
        let book2 = Book{Title:'1000 ways',};
        let book3 = Book{Title:'Influence People',};
        let book4 = Book{Title:'Lorem Ipsum',};
        let book5 = Book{Title:'Hello world',};

        let mut db:Array<Book> = ArrayTrait::new();
        self.Bk.write(db,);

        let mut db = self.Bk.read();
        db.append(book1);
        db.append(book2);
        db.append(book3);
        db.append(book4);
        db.append(book5);
     }

    #[external(v0)]
    impl DatabaseTraitImp of super::DatabaseTrait<ContractState>{

        fn display_books(self: @ContractState){
            let mut arr = ArrayTrait::<Book>::new();
            arr = self.Bk.read();

            let len = arr.len();
            let mut i:usize = 0;

            loop{
                if len<i{
                    break;
                }
                let mut books:Book = *arr.at(i);
                books.book_title_display();
                i+=1;
            }
            //self.Bk.read()
        }
    }

}
