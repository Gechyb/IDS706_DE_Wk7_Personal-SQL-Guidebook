/*JOINs*/

-- Get all customer names with their sales rep’s full name.
SELECT c.customerName, e.firstName, e.lastName
FROM customers c
INNER JOIN employees e
    ON c.salesRepEmployeeNumber = e.employeeNumber;

-- List all customers and their sales reps (include customers with no assigned rep).
SELECT c.customerName, e.firstName, e.lastName
FROM customers c
LEFT JOIN employees e
    ON c.salesRepEmployeeNumber = e.employeeNumber;

-- Simulate RIGHT JOIN for customers and employees by flipping the tables
SELECT c.customerName, e.firstName, e.lastName
FROM employees e
LEFT JOIN customers c
    ON c.salesRepEmployeeNumber = e.employeeNumber;

-- Combine customers with reps + reps without customers.
SELECT c.customerName, e.firstName, e.lastName
FROM customers c
FULL OUTER JOIN employees e
    ON c.salesRepEmployeeNumber = e.employeeNumber;

-- Pair all customers with all offices (demo only)
SELECT c.customerName, o.city
FROM customers c
CROSS JOIN offices o;

-- join using union 
-- Customers with sales reps
SELECT c.customerName, e.firstName, e.lastName
FROM customers c
LEFT JOIN employees e
    ON c.salesRepEmployeeNumber = e.employeeNumber

UNION

-- Employees without customers
SELECT c.customerName, e.firstName, e.lastName
FROM employees e
LEFT JOIN customers c
    ON c.salesRepEmployeeNumber = e.employeeNumber;

-- join with multiple tables
SELECT o.orderNumber, c.customerName, e.firstName || ' ' || e.lastName AS salesRep
FROM orders o
INNER JOIN customers c ON o.customerNumber = c.customerNumber
INNER JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;
