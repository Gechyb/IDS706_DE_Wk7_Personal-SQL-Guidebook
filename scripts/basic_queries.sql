/* Peforming CRUD (Create, Read, Update and Delete) operations */

-- to get a list of all table names
.tables

-- Or this
SELECT name FROM sqlite_master WHERE type='table';

-- to see the schema including tables and indices
.schema

-- Checking the number of row I have before performing crude steps
SELECT COUNT(*) as total
FROM productlines;

--  Fetch the first 10 rows of data from the table
SELECT *
FROM customers
LIMIT 10;

-- Update the rows 
UPDATE employees
SET jobTitle = 'Senior Sales Rep'
WHERE firstName = 'Leslie' AND lastName = 'Thompson';

-- Retrieve specific columns from a table and filter based on condition
SELECT * 
FROM employees
WHERE lastName = 'Thompson' AND firstName = 'Leslie';

SELECT customerName, country, creditLimit
FROM customers
WHERE country = 'USA' AND creditLimit > 50000;

-- Order rows by descending order. Use ASC for ascending order.
SELECT productName, buyPrice, quantityInStock
FROM products
ORDER BY buyPrice DESC;

-- Aggregate rows that share a common value:
SELECT country, COUNT(customerNumber) AS num_customers
FROM customers
GROUP BY country;
