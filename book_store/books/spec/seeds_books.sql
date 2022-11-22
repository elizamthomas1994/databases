TRUNCATE TABLE books RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO books (id, title, author_name) VALUES ('1', 'Nineteen Eighty-Four', 'George Orwell');
INSERT INTO books (id, title, author_name) VALUES ('2', 'Anna Karenina', 'Leo Tolstoy');