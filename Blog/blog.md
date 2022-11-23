1. Extract nouns from the user stories or specification
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a blogger
So I can write interesting stuff
I want to write posts having a title.

As a blogger
So I can write interesting stuff
I want to write posts having a content.

As a blogger
So I can let people comment on interesting stuff
I want to allow comments on my posts.

As a blogger
So I can let people comment on interesting stuff
I want the comments to have a content.

As a blogger
So I can let people comment on interesting stuff
I want the author to include their name in comments.
`
Nouns:

post, title, blog_content, comment, comment_content, comment_name

2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.

Record	Properties
post	title, post_content
comment	comment_content, comment_name
Name of the first table (always plural): posts

Column names: title, post_content

Name of the second table (always plural): comments

Column names: comment_content, comment_name

3. Decide the column types.
Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

Table: posts
id: SERIAL
title: text
post_content: text

Table: comments
id: SERIAL
comment_content: text
comment_name: text

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

1. Can one post have many comments? YES
2. Can one commnet have many posts? NO

-> Therefore,
-> An post HAS MANY comments
-> An comment BELONGS TO an post

-> Therefore, the foreign key is on the comments table.
If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).

4. Write the SQL.
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  post_content text
);

-- Then the table with the foreign key first.
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  comment_content text,
  comment_name text,
  post_id int,
  constraint fk_post foreign key(post_id)
    references posts(id)
    on delete cascade
);
5. Create the tables.
psql -h 127.0.0.1 database_name < posts_table.sql