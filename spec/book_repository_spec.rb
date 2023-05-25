require 'book_repository'
  
RSpec.describe BooksRepository do
    def reset_book_table
        seed_sql = File.read('spec/seeds_books.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
        connection.exec(seed_sql)
    end

    describe BooksRepository do
        before(:each) do
        reset_book_table
        end
    end

    it "displays id, title and author name" do
        repo = BooksRepository.new
        books = repo.all
        expect(books.size).to eq(9)
        expect(books.first.title).to eq ('Nineteen Eighty-Four')
        expect(books.first.author_name).to eq ('George Orwell')
        
    end
end

