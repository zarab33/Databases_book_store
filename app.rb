require_relative 'lib/database_connection'

DatabaseConnection.connect('book_store')

result = DatabaseConnection.exec_params('   select * FROM author_name;')