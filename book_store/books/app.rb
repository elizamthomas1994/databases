require_relative 'lib/database_connection'
require_relative 'lib/book_repository'

DatabaseConnection.connect('book_store')

book_repository = BookRepository.new

# Print out each record from the result set .
book_repository.all.each do |record|
  p record
end