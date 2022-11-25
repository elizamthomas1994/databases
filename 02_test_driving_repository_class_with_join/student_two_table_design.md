{students}Two Tables Design Recipe Template
Copy this recipe template to design and create two related database tables from a specification.

1. Extract nouns from the user stories or specification

```
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
```
Nouns:

students name, cohorts names, cohorts starting dates, 



| Record      | Properties                |
| ----------- | -----------------------   |
| students    | name                      |
| cohorts     | name, starting_date


2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.


Name of the first table (always plural): `students`

Column names:  `name`

Name of the second table (always plural): `cohorts`

Column names: `name` , `starting_date`


3. Decide the column types.
Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

Table: students
id: SERIAL
name: text

Table: cohorts
id: SERIAL
name: text
starting date: date 



4. Decide on The Tables Relationship


```

Can one student have many cohorts? (NO)
Can one cohort have many students? (YES)

Student -> many to one -> cohort 

You'll then be able to say that:

A cohort has many students,
A student belongs to one cohort

Therefore, the foreign key is on the students (cohort_id)

```
4. Write the SQL.
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY,
  name text,
  starting_date date
);

-- Then the table with the foreign key first.

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,

-- The foreign key name is always {other_table_singular}_id

  cohort_id int,
  constraint fk_cohort foreign key(cohort_id)
    references cohorts(id)
);


5. Create the tables.
psql -h 127.0.0.1 student_directory_2 < student_table.sql