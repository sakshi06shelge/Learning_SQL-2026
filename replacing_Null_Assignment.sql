-- 1.	Create a database named employee_null_demo.

CREATE DATABASE employee_null_demo;

-- 2.	Select the employee_null_demo database for use.
USE employee_null_demo;

-- 3.	Create a table named employees with appropriate columns.
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10,2)
);

-- 4.	Insert at least 10 records into the employees table, including some NULL values.
INSERT INTO employees
(employee_name, department, salary)
VALUES
('Sakshi', 'IT', 75000),
('Rutuja', 'HR', 60000),
('Jay', NULL, 55000),
('Amit', 'Sales', NULL),
('Neha', NULL, NULL),
('Rahul', 'Finance', 65000),
('Priya', 'IT', NULL),
('Kiran', NULL, 50000),
('Sneha', 'Marketing', 58000),
('Rohan', 'Sales', NULL);

-- 5.	Display all records from the employees table.
SELECT * FROM employees;

-- 6.	Display the employee name and replace NULL department values using IFNULL().
SELECT
    employee_name,
    ifnull(department,  'Not Assigned') AS department
    FROM employees;
    
-- 7.	Display the employee name and replace NULL salary values using IFNULL().
SELECT
    employee_name,
    ifnull(salary, 0) AS salary
    FROM employees;
    
-- 8.	Display the employee name, department, and salary by replacing all NULL values using IFNULL().
SELECT
    employee_name,
    IFNULL(department, 'Not Assigned') AS department,
    IFNULL(salary, 0) AS salary
FROM employees;

-- 9.	Display the employee name and replace NULL department values using COALESCE().
SELECT
    employee_name,
    coalesce(department, 'Unassigned') AS department
    FROM employees;
    
-- 10.	Display the employee name and replace NULL salary values using COALESCE().
SELECT
    employee_name,
    coalesce(salary, 0) AS salary
    FROM employees;
    
-- 11.	Display the employee name, department, and salary by replacing all NULL values using COALESCE().
SELECT
    employee_name,
    coalesce(department, 'NOTAssigned') AS department,
    coalesce(salary, 0) AS salary
    FROM employees;
    
-- 12.	Create another table named students with appropriate columns.
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100),
    course VARCHAR(100),
    marks INT
);

-- 13.	Insert at least 10 records into the students table, including NULL values.
INSERT INTO students
(student_name, course, marks)
VALUES
('Aarav', 'Java', 85),
('Anaya', 'Python', 90),
('Vivek', NULL, 75),
('Pooja', 'SQL', NULL),
('Rahul', NULL, NULL),
('Sneha', 'JavaScript', 88),
('Karan', 'Python', NULL),
('Isha', NULL, 92),
('Riya', 'SQL', 78),
('Aditya', 'Java', NULL);

SELECT * FROM students;

-- 14.	Display the student name and replace NULL course values using IFNULL().
SELECT
    student_name,
    ifnull(course, 'Notapplicable') AS course
    FROM students;

-- 15.	Display the student name and replace NULL marks values using IFNULL().
SELECT student_name,
       ifnull(marks, 0) AS marks
       FROM students;
       
-- 16.	Display the student name, course, and marks by replacing NULL values using COALESCE().
SELECT
     student_name,
     coalesce(course, 'NotApplicable') AS course,
     coalesce(marks,0) AS marks
     FROM students;

-- 17.	Create another table named products with appropriate columns.
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10,2)
);
  
-- 18.	Insert at least 10 records into the products table, including NULL values.

INSERT INTO products
(product_name, category, price)
VALUES
('Laptop', 'Electronics', 55000),
('Mouse', 'Accessories', 800),
('Keyboard', NULL, 1500),
('Monitor', 'Electronics', NULL),
('Printer', NULL, 12000),
('Headphones', 'Accessories', 2500),
('Mobile', NULL, NULL),
('Tablet', 'Electronics', 22000),
('Speaker', 'Audio', NULL),
('Webcam', NULL, 3500);

SELECT * FROM products;

-- 19.	Display the product name and replace NULL category values using IFNULL().
SELECT
    product_name,
    IFNULL(category, 'Not Assigned') AS category
FROM products;

-- 20.	Display the product name, category, and price by replacing NULL values using COALESCE().
SELECT
    product_name,
    COALESCE(category, 'Not Assigned') AS category,
    COALESCE(price, 0) AS price
FROM products;
