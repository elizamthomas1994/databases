TRUNCATE TABLE cohorts RESTART IDENTITY CASCADE;


INSERT INTO cohorts (name, starting_date) VALUES('R', '2022,01,01');
INSERT INTO cohorts (name, starting_date) VALUES('M', '2022,02-07');

INSERT INTO students (name, cohort_id) VALUES ('Rupa', 2);
INSERT INTO students (name, cohort_id) VALUES ('Toby', 1);
INSERT INTO students (name, cohort_id) VALUES ('Myles', 1);
INSERT INTO students (name, cohort_id) VALUES ('Susie', 2);