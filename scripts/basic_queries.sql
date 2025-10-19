/* Peforming CRUD (Create, Read, Update and Delete) operations */

--  Fetch the first 10 rows of data from the table
SELECT *
FROM students
LIMIT 10;

-- Checking the number of row I have before performing crude steps
SELECT COUNT(*) as total_instructors
FROM instructors;

-- Retrieve the record we just created
SELECT * 
FROM university_rankings
WHERE institution = "Duke Tech";