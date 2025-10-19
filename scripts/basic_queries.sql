/* Peforming CRUD (Create, Read, Update and Delete) operations */

-- to get a list of all table names
.tables

-- Or this
SELECT name FROM sqlite_master WHERE type='table';

-- to see the schema including tables and indices
.schema

-- Checking the number of row I have before performing crude steps
SELECT COUNT(*) as total_instructors
FROM instructors;

--  Fetch the first 10 rows of data from the table
SELECT *
FROM grades
LIMIT 10;

-- Sort output in ascending and descending order
SELECT name, age
FROM 
