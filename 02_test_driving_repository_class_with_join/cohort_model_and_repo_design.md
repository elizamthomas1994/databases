{{Cohort}} Model and Repository Classes Design Recipe
Copy this recipe template to design and implement Model and Repository classes for a database table.

1. Design and create the Table

Table: cohorts

Columns:
id | name | starting_date



2. Create Test SQL seeds

TRUNCATE TABLE cohorts RESTART IDENTITY CASCADE;


INSERT INTO cohorts (name, starting_date) VALUES('R', '2022,01,01');
INSERT INTO cohorts (name, starting_date) VALUES('M', '2022,02-07');

INSERT INTO students (name, cohort_id) VALUES ('Rupa', 2);
INSERT INTO students (name, cohort_id) VALUES ('Toby', 1);
INSERT INTO students (name, cohort_id) VALUES ('Myles', 1);
INSERT INTO students (name, cohort_id) VALUES ('Susie', 2);



3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.



# Model class
# (in lib/student.rb)
class Cohort
end

# Repository class
# (in lib/student_repository.rb)
class CohortRepository
end



4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.


class Cohort
  attr_accessor :id, :name, :starting_date, :students

  def initialize
    @students = []
  end
end



5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.


class CohortRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students;

    # Returns an array of Student objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)

  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students WHERE id = $1;

    # Returns a single Student object.
  end
end



6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get all students

repo = StudentRepository.new

students = repo.all

students.length # =>  2

students[0].id # =>  1
students[0].name # =>  'David'
students[0].cohort_name # =>  'April 2022'

students[1].id # =>  2
students[1].name # =>  'Anna'
students[1].cohort_name # =>  'May 2022'

# 2
# Get a single student

repo = StudentRepository.new

student = repo.find(1)

student.id # =>  1
student.name # =>  'David'
student.cohort_name # =>  'April 2022'

# Add more examples for each method
Encode this example as a test.

7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/cohort_repository_spec.rb

def reset_cohorts_table
  seed_sql = File.read('spec/seeds_students.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2_test' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_cohorts_table
  end

  # (your tests will go here).
end
8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

