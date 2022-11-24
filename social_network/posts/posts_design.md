1. Design and create the Table
If the table is already created in the database, you can skip this step.

Otherwise, follow this recipe to design and create the SQL schema for your table.

2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: spec/seeds_posts.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

psql -h 127.0.0.1 social_network < seeds_posts.sql

3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

```ruby
# EXAMPLE
# Table name: posts

# Model class
# (in lib/post.rb)
class Post
end

# Repository class
# (in lib/post_repository.rb)
class PostRepository
end
```

4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: posts

# Model class
# (in lib/post.rb)

class Post

  # Replace the attributes by your own columns.
  attr_accessor :title, :content, :number_of_views, :account_id
end
```

5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: posts

# Repository class
# (in lib/post_repository.rb)

class PostRepository
  def all
    # Executes the SQL query:
    # SELECT title, content, number_of_views, account_id FROM posts;

    # Returns an array of post objects.
  end

  def find(id)
    # Executes the SQL query:
    # SELECT id, title, content, number_of_views, account_id WHERE id = $1;

    # Returns a single Student object.
  end

  def create(post)
    # Execute the SQL query:
    # INSERT INTO students (title, content, number_of_views, account_id) VALUES ($1, $2, $3, $4);

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
# Get all posts

repo = PostRepository.new

posts = repo.all
posts.length # => 2
posts.first.post_id # => '1'
posts.first.title # => 'Hello!'
posts.first.contents # => 'hello world'
posts.first.number_of_views # => 100
posts.first.account_id # => 1

# 2
# Get a single post

repo = postRepository.new

post = repo.find(1)

post.post_id # => '1'
post.title # => 'Hello!'
post.contents # => 'hello world'
post.number_of_views # => 100
post.account_id # => 1

# 3
# Creates a new instance of post

repo = PostRepository.new

post = post.new
post.title # => 'Bonjour!'
post.contents # => 'Bonjour monde'
post.number_of_views # => 300
post.account_id # => 2

repo.create(post)

all_posts = repo.all

# 4
# Delete an instance of post from the posts table

repo = PostRepository.new

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

# file: spec/post_repository_spec.rb

def reset_posts_table
  seed_sql = File.read('spec/seeds_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'posts' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end

  # (your tests will go here).
end

8. Test-drive and implement the Repository class behaviour

# After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.