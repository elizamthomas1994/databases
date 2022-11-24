-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO posts (title, content, number_of_views, account_id) VALUES ('Hello!', 'hello world', 100, 1);
INSERT INTO posts (title, content, number_of_views, account_id ) VALUES ('Hola!', 'hola mundo', 1000, 2);