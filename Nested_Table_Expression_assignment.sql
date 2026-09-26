CREATE DATABASE analytics_demo;
USE analytics_demo;

-- . Create a table `customers` with appropriate columns for customer ID, name, city, and registration date.
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    registration_date DATE
);

-- Create a table `orders` with appropriate columns for order ID, customer ID, order amount, and order date, ensuring proper relationship between tables.
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE,

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

-- Insert at least 10 records into both tables with realistic values.
INSERT INTO customers
(customer_name, city, registration_date)
VALUES
('Amit Sharma', 'Pune', '2021-01-15'),
('Neha Patil', 'Mumbai', '2022-03-20'),
('Rahul Verma', 'Delhi', '2020-06-10'),
('Priya Shah', 'Pune', '2021-08-05'),
('Rohit Mehta', 'Mumbai', '2023-02-18'),
('Sneha Joshi', 'Nashik', '2020-11-25'),
('Karan Singh', 'Delhi', '2022-09-12'),
('Pooja Deshmukh', 'Pune', '2019-05-30'),
('Vikas Kulkarni', 'Nashik', '2021-12-10'),
('Anjali Gupta', 'Mumbai', '2020-04-15');

INSERT INTO orders
(customer_id, order_amount, order_date)
VALUES
(1, 80000, '2022-01-10'),
(2, 55000, '2022-06-12'),
(3, 40000, '2021-04-10'),
(3, 45000, '2023-05-15'),
(4, 90000, '2022-08-20'),
(5, 30000, '2023-04-12'),
(6, 60000, '2021-02-20'),
(7, 50000, '2023-01-10'),
(8, 95000, '2021-06-15'),
(9, 40000, '2022-02-15'),
(10, 70000, '2021-03-10');

SELECT * FROM customers;
SELECT * FROM orders;

-- . Display customer names along with their order amounts and order dates.
SELECT
c.customer_name,
o.order_amount,
o.order_date
FROM customers  c 
INNER JOIN orders  o
ON c.customer_id = o.customer_id;

-- Retrieve all customers along with the total number of orders placed by each.
SELECT
c.customer_name,
count(o.order_amount) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- Show the total order amount spent by each customer.
SELECT
    c.customer_name,
    SUM(o.order_amount)AS total_spending
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- List customers who have placed more than 2 orders.
SELECT
c.customer_name,
COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 2;

-- Find the average order amount for each city.
SELECT
c.city,
AVG(o.order_amount) AS averag_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- Display the maximum and minimum order amount for each customer.
SELECT
c.customer_name,
max(o.order_amount) AS maximum_amount,
min(o.order_amount) AS minimum_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- Find all customers whose total order amount is greater than 100,000.
SELECT
c.customer_name,
sum(o.order_amount) AS total_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_id
HAVING sum(o.order_amount) > 100000;

-- Display cities where the average order amount is greater than 50,000.
SELECT 
c.city,
AVG(o.order_amount) AS average_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING AVG(o.order_amount) > 50000;

-- 13. Retrieve customers whose total spending is higher than the average spending of all customers.

SELECT 
c.customer_name,
SUM(o.order_amount) AS total_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING AVG(o.order_amount) >(
    SELECT AVG(order_amount)
    FROM orders
);

-- 14. Find customers who have placed orders after 2022 and count how many such orders they have, showing only those with more than 1 such order.
SELECT
    c.customer_name,
    COUNT(o.order_id) AS orders_after_2022
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_date >= '2023-01-01'
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) >= 1;

-- 15. Display customers whose average order amount is greater than 60,000 and sort them in descending order of average amount.
SELECT
    c.customer_name,
    AVG(o.order_amount) AS avg_order_amount
FROM customers c
INNER JOIN orders o
ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING AVG(o.order_amount) > 60000
ORDER BY avg_order_amount DESC;

-- 16. Find cities where the total number of orders is greater than the average number of orders across all cities.
SELECT
    c.city,
    COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING COUNT(o.order_id) >
(
    SELECT AVG(city_order_count)
    FROM
    (
        SELECT
            c2.city,
            COUNT(o2.order_id) AS city_order_count
        FROM customers c2
        INNER JOIN orders o2
        ON c2.customer_id = o2.customer_id
        GROUP BY c2.city
    ) AS city_totals
);

-- 17. Retrieve customers where the number of orders with amount greater than 70,000 is at least 2.
SELECT
    c.customer_name,
    COUNT(o.order_id) AS high_value_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_amount > 70000
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) >= 2;

-- 18. Find customers whose total spending including a 10% bonus exceeds 150,000.
SELECT
    c.customer_name,
    SUM(o.order_amount) AS total_spending,
    SUM(o.order_amount) * 1.10 AS spending_with_bonus
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.order_amount) * 1.10 > 150000;

-- 19. Display customers who have been active for more than 3 years and have placed more than 3 orders.
SELECT
    c.customer_name,
    c.registration_date,
    COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.registration_date < DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
GROUP BY c.customer_id, c.customer_name, c.registration_date
HAVING COUNT(o.order_id) > 3;


-- 20. Find customers where:

-- tal number of orders is at least 2
-- average order amount is greater than 50,000
-- maximum order amount exceeds 90,000
  -- Sort the result based on maximum order amount in descending order.
  
  SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    AVG(o.order_amount) AS average_order_amount,
    MAX(o.order_amount) AS maximum_order_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) >= 2
   AND AVG(o.order_amount) > 50000
   AND MAX(o.order_amount) > 90000
ORDER BY maximum_order_amount DESC;

