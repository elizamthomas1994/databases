1. Design and create the Table
If the table is already created in the database, you can skip this step.

Otherwise, follow this recipe to design and create the SQL schema for your table.

2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: spec/seeds_accounts.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

psql -h 127.0.0.1 social_network < seeds_accounts.sql

3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

```ruby
# EXAMPLE
# Table name: accounts

# Model class
# (in lib/account.rb)
class Account
end

# Repository class
# (in lib/account_repository.rb)
class AccountRepository
end
```

4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: accounts

# Model class
# (in lib/account.rb)

class Account

  # Replace the attributes by your own columns.
  attr_accessor :account_id, :email_address, :username
end
```

5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: accounts

# Repository class
# (in lib/account_repository.rb)

class AccountRepository
  def all
    # Executes the SQL query:
    # SELECT account_id, title, release_year FROM accounts;

    # Returns an array of Account objects.
  end

  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students WHERE id = $1;

    # Returns a single Student object.
  end

  def create(account)
    # Execute the SQL query:
    # INSERT INTO students (name, cohort_name) VALUES ($1, $2);

    # Returns nothing
  end

   def delete(id)
    # Execute the SQL query:
    # DELETE FROM students WHERE id = $1;

    # Returns nothing
  end
end
```

6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all accounts

repo = AccountRepository.new

accounts = repo.all
accounts.length # => 2
accounts.first.account_id # => '1'
accounts.first.email_address # => 'hello@world.com'
accounts.first.username # => 'helloworld'

# 2
# Get a single account

repo = AccountRepository.new

account = repo.find(1)

account.account_id # =>  1
accounts.email_address # => 'hello@world.com'
accounts.username # => 'helloworld'

# 3
# Creates a new instance of account

repo = AccountRepository.new

account = Account.new
account.email_address # => 'bonjour@monde.com'
account.username # => bonjourmonde

repo.create(account)

all_accounts = repo.all

# 4
# Delete an instance of account from the accounts table

repo = AccountRepository.new

# Delete the student with id=1
repo.delete(1)

repo.all # The student with id=1 should now be removed.

```
Encode this example as a test.

7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/account_repository_spec.rb

def reset_accounts_table
  seed_sql = File.read('spec/seeds_accounts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'accounts' })
  connection.exec(seed_sql)
end

describe AccountRepository do
  before(:each) do 
    reset_accounts_table
  end

  # (your tests will go here).
end

8. Test-drive and implement the Repository class behaviour

# After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.