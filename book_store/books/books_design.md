1. Design and create the Table
If the table is already created in the database, you can skip this step.

Otherwise, follow this recipe to design and create the SQL schema for your table.

2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: spec/seeds_books.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE students RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO students (name, cohort_name) VALUES ('David', 'April 2022');
INSERT INTO students (name, cohort_name) VALUES ('Anna', 'May 2022');
Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql

3. Define the class names

# Model class
# (in lib/book.rb)
```ruby
class Book
end

# Repository class
# (in lib/book_repository.rb)
class BooktRepository
end
```

4. Implement the Model class

```ruby
class Book

  # Replace the attributes by your own columns.
  attr_accessor :id, :title, :author_name
end
```

5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

# EXAMPLE
# Table name: books

# Repository class
# (in lib/book_repository.rb)

```ruby
class BookRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students;

    # Returns an array of Student objects.
  end
end
```

6. Write Test Examples

# EXAMPLES

# 1
# Get all books

```ruby
repo = BookRepository.new

books = repo.all

books.length # =>  2

books.first.id # =>  1
books.first.title # =>  'Nineteen Eighty-Four'
books.first.author_name # =>  'George Orwell'

books[1].id # =>  2
books[1].title # =>  'Anna Karenina'
books[1].author_name # =>  'Leo Tolstoy'
```

7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

def reset_students_table
  seed_sql = File.read('spec/seeds_students.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'students' })
  connection.exec(seed_sql)
end

describe BookRepository do
  before(:each) do 
    reset_students_table
  end

  # (your tests will go here).
end

8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

