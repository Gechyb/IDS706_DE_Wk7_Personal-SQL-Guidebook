/* Advanced queries*/

-- categorize customers by credit limit
SELECT 
    customerName,
    creditLimit,
    CASE 
        WHEN creditLimit >= 100000 THEN 'High Value'
        WHEN creditLimit BETWEEN 50000 AND 99999 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customerCategory
FROM customers
ORDER BY creditLimit DESC;

-- clean up missing states
SELECT 
    customerName,
    city,
    COALESCE(state, 'Unknown') AS cleanedState,
    country
FROM customers
LIMIT 10;

-- extract and format customer info
SELECT 
    customerName,
    UPPER(contactFirstName || ' ' || contactLastName) AS fullNameUpper,
    SUBSTR(phone, 1, 5) AS phonePrefix
FROM customers
LIMIT 10;

-- extract Year and Month from Order Date
SELECT 
    orderNumber,
    orderDate,
    strftime('%Y', orderDate) AS orderYear,
    strftime('%m', orderDate) AS orderMonth
FROM orders
LIMIT 10;

-- ranking sustomers by credit limit within each country
SELECT 
    country,
    customerName,
    creditLimit,
    RANK() OVER (PARTITION BY country ORDER BY creditLimit DESC) AS creditRank
FROM customers;

-- running totals with SUM OVER
SELECT 
    customerNumber,
    paymentDate,
    amount,
    SUM(amount) OVER (PARTITION BY customerNumber ORDER BY paymentDate) AS runningTotal
FROM payments
WHERE customerNumber = 124;

-- compare row to previous one with LAG
SELECT 
    customerNumber,
    paymentDate,
    amount,
    LAG(amount, 1) OVER (PARTITION BY customerNumber ORDER BY paymentDate) AS prevPayment,
    amount - LAG(amount, 1) OVER (PARTITION BY customerNumber ORDER BY paymentDate) AS diffFromPrev
FROM payments
WHERE customerNumber = 124;

/* Common Table Expressions (CTEs)*/

-- total order per customer with CTE
WITH customer_orders AS (
    SELECT 
        c.customerNumber,
        c.customerName,
        COUNT(o.orderNumber) AS totalOrders
    FROM customers c
    JOIN orders o 
        ON c.customerNumber = o.customerNumber
    GROUP BY c.customerNumber
)
SELECT * 
FROM customer_orders
ORDER BY totalOrders DESC
LIMIT 10;

-- recursive cte (advanced)
WITH RECURSIVE employee_hierarchy AS (
    SELECT employeeNumber, firstName, lastName, reportsTo AS manager
    FROM employees
    WHERE reportsTo IS NULL  -- Start with top-level (President)

    UNION ALL

    SELECT e.employeeNumber, e.firstName, e.lastName, e.reportsTo
    FROM employees e
    INNER JOIN employee_hierarchy eh 
        ON e.reportsTo = eh.employeeNumber
)
SELECT * 
FROM employee_hierarchy
LIMIT 10;

