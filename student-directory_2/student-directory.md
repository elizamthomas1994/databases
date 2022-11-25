1. Extract nouns from the user stories or specification
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a coach
So I can get to know all students
I want to see a list of students' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' starting dates.

As a coach
So I can get to know all students
I want to see a list of students' cohorts.

Nouns:

student_name, cohort_name, cohort_start_date

2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.

Record	| Properties
student   student_name cohort_name
cohort    cohort_name, cohort_start_date

Name of the first table (always plural): students

Column names: student_name, cohort_name

Name of the second table (always plural): cohorts

Column names: cohort_name, cohort_start_date

3. Decide the column types.
Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

Table: students
id: SERIAL
student_name: text
cohort_name: text

Table: cohorts
id: SERIAL
cohort_name: text
cohort_start_date: text

4. Decide on The Tables Relationship
Most of the time, you'll be using a one-to-many relationship, and will need a foreign key on one of the two tables.

To decide on which one, answer these two questions:

Can one [TABLE ONE] have many [TABLE TWO]? (Yes/No)
Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)
You'll then be able to say that:

[A] has many [B]
And on the other side, [B] belongs to [A]
In that case, the foreign key is in the table [B]
Replace the relevant bits in this example with your own:

# EXAMPLE

1. Can one artist have many albums? YES
2. Can one album have many artists? NO

1. Can one student have many cohorts? NO
2. Can one cohort have many students? YES

-> Therefore,
-> A cohort HAS MANY students
-> A student BELONGS TO a cohort

-> Therefore, the foreign key is on the students table.

4. Write the SQL.
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY,
  cohort_name text,
  cohort_start_date text
);

-- Then the table with the foreign key first.
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  student_name text,
  cohort_name text,
  cohort_id int,
  constraint fk_student foreign key(cohort_id)
    references cohorts(id)
    on delete cascade
);

5. Create the tables.
psql -h 127.0.0.1 student_directory_2 < students_table.sql