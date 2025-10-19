/* Peforming CRUD (Create, Read, Update and Delete) operations */

-- to get a list of all table names
.tables

-- Or this
SELECT name FROM sqlite_master WHERE type='table';

-- to see the schema including tables and indices
.schema

-- Count how many row (or distinct values) are in a column
SELECT COUNT(*) AS total
FROM productlines;

-- Count distinct countries where customers are located
SELECT COUNT(DISTINCT country) AS unique_countries
FROM customers;

--  Fetch the first 10 rows of data from the table
SELECT customerName, country, creditLimit
FROM customers
LIMIT 10;

-- Update the rows 
UPDATE employees
SET jobTitle = 'Senior Sales Rep'
WHERE firstName = 'Leslie' AND lastName = 'Thompson';

-- delete specific row
DELETE FROM orderdetails
WHERE orderNumber = 10112;

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

-- Filter results after aggregation (works like WHERE but on grouped data):
SELECT country, COUNT(customerNumber) AS num_customers
FROM customers
GROUP BY country
HAVING num_customers > 2;

-- Average credit limit of customers
SELECT AVG(buyPrice) AS avg_product_price
FROM products;

-- Highest order amount paid
SELECT MAX(amount) AS max_payment
FROM payments;

-- Smallest stock level across all products
SELECT MIN(quantityInStock) AS min_stock
FROM products;

-- Total payments received
SELECT SUM(amount) AS total_payments
FROM payments;

-- Total stock across all products
SELECT SUM(quantityInStock) AS total_stock
FROM products;

-- Number of customers per country
SELECT country, COUNT(customerNumber) AS num_customers
FROM customers
GROUP BY country
ORDER BY num_customers DESC;

-- Average payment per customer
SELECT customerNumber, AVG(amount) AS avg_payment
FROM payments
GROUP BY customerNumber
ORDER BY avg_payment DESC;

