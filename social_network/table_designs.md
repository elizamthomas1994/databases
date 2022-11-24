1. Extract nouns from the user stories or specification
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a social network user,
So I can have my information registered,
I'd like to have a user account with my email address.

As a social network user,
So I can have my information registered,
I'd like to have a user account with my username.

As a social network user,
So I can write on my timeline,
I'd like to create posts associated with my user account.

As a social network user,
So I can write on my timeline,
I'd like each of my posts to have a title and a content.

As a social network user,
So I can know who reads my posts,
I'd like each of my posts to have a number of views.
`
Nouns:

account, email_address, username, 
posts, title, content, number_of_views

2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.

Record	Properties
account	email_address, username,
posts	title, content, number_of_views
Name of the first table (always plural): accounts

Column names: email_address, username,

Name of the second table (always plural): posts

Column names: title, content, number_of_views

3. Decide the column types.
Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

Table: accounts
id: SERIAL
email_address: text
username: text

Table: posts
id: SERIAL
title: text
content: text
number_of_views: int

4. Decide on The Tables Relationship

# EXAMPLE

1. Can one user account have many posts? YES
2. Can one post have many user accounts? NO

-> Therefore,
-> An account HAS MANY posts
-> A post BELONGS TO an account

-> Therefore, the foreign key is on the posts table.

4. Write the SQL.
-- EXAMPLE
-- file: accounts_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  email_address text,
  username text
);

-- Then the table with the foreign key first.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text,
  number_of_views int,
  account_id int,
  constraint fk_account foreign key(account_id)
    references accounts(id)
    on delete cascade
);

5. Create the tables.
psql -h 127.0.0.1 social_network < accounts_table.sql