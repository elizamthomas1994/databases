TRUNCATE TABLE cohorts RESTART IDENTITY CASCADE;


INSERT INTO cohorts (cohort_name, cohort_start_date) VALUES('R', '2022,01,01');
INSERT INTO cohorts (cohort_name, cohort_start_date) VALUES('M', '2022,02-07');

INSERT INTO students (student_name, cohort_name, cohort_id) VALUES ('Rupa', 'M', 2);
INSERT INTO students (student_name, cohort_name, cohort_id) VALUES ('Toby', 'R', 1);
INSERT INTO students (student_name, cohort_name, cohort_id) VALUES ('Myles', 'M', 1);
INSERT INTO students (student_name, cohort_name, cohort_id) VALUES ('Susie', 'R', 2);