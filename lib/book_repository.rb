require_relative './book'

class BooksRepository
  def all
    books = []

    # Executes the SQL query:
    sql = 'SELECT id, title, author_name FROM books;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |row|
      book = Book.new

      book.id = row['id']
      book.title = row['title']
      book.author_name = row['author_name']

      books << book
    end

    return books
  end
end

