-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE accounts RESTART IDENTITY CASCADE; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO accounts (email_address, username, account_id) VALUES ('hello@world.com', 'helloworld', 1);
INSERT INTO accounts (email_address, username, account_id) VALUES ('hola@mundo.com', 'holamundo', 2);