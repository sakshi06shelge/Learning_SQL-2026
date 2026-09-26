-- 1.	Create a database named string_functions_practice.
CREATE DATABASE string_functions_practice;

-- 2.	Select the string_functions_practice database for use.
USE string_functions_practice;

-- 3.	Create a table named messages with appropriate columns.
CREATE TABLE messages (
    message_id INT PRIMARY KEY AUTO_INCREMENT,
    text_value VARCHAR(200)
);

-- 4.	Insert at least 10 text records into the messages table.
INSERT INTO messages (text_value) VALUES
('Hello World'),
('Welcome to MySQL'),
('Learn SQL Easily'),
('Good Morning'),
('Have a Nice Day'),
('Database Practice'),
('String Functions'),
('SQL is Powerful'),
('I Love Coding'),
('Practice Makes Perfect');

-- 5.	Display all records from the messages table.
SELECT * FROM messages;

-- 6.	Display the first 4 characters of each text value.
SELECT 
    text_value,
    left(text_value, 4) AS first_4_characters
    FROM messages;
    
-- 7.	Display the last 5 characters of each text value.
SELECT 
    text_value,
    right(text_value, 5) AS last_5_characters
    FROM messages;
    
-- 8.	Find the position of a specific word in each text using the LOCATE() function.
SELECT text_value,
       LOCATE('SQL', text_value) AS position
FROM messages;

-- 9.	Find the position of a specific word in each text using the INSTR() function.
SELECT text_value,
       INSTR(text_value, 'SQL') AS position
FROM messages;

-- 10.	Find the position of a specific word in each text using the POSITION() function.
SELECT text_value,
       POSITION('SQL' IN text_value) AS position
FROM messages;

-- 11.	Display each text value in reverse order.
SELECT
     text_value,
     reverse(text_value) AS reverse_text
     FROM messages;
     
-- 12.	Display each text value after applying left padding.
SELECT
     text_value,
     lpad(text_value, 20, '*') AS left_padding
     FROM messages;
     
-- 13.	Display each text value after applying right padding.
SELECT
text_value,
rpad(text_value, 30, '#') AS right_padding
FROM messages;

-- 14.	Display each text value after removing leading spaces.
SELECT LTRIM('   Hello World') AS result;

-- 15.	Display each text value after removing trailing spaces.
SELECT RTRIM('Hello World   ') AS result;

-- 16.	Display the total number of characters and total byte length for each text value.
SELECT
text_value,
char_length(text_value) AS character_length,
length(text_value) AS byte_length
FROM messages;

-- 17.	Display each text value repeated three times.
SELECT
     text_value,
     repeat(text_value, 3) AS repeated_text
     FROM messages;
     
 -- 18.	Join two strings with spaces using the CONCAT() and SPACE() functions.
 SELECT CONCAT('Hello', SPACE(1), 'World') AS result;
 
 -- 19.	Find the position of a specific value using the FIELD() function.
 SELECT FIELD('Banana', 'Apple', 'Mango', 'Banana', 'Orange') AS position;

-- 20.	Search for a value in a comma-separated list using the FIND_IN_SET() function.
SELECT FIND_IN_SET('Mango', 'Apple,Banana,Mango,Orange') AS position;

-- 21.	Display the second value from a list using the ELT() function.
SELECT 
elt(2, 'Banana', 'Apple', 'Mango', 'Banana', 'Orange' ) AS second_position;

-- 22.	Display the selected values using the MAKE_SET() function.
SELECT MAKE_SET(4, 'Apple', 'Banana', 'Mango') AS result;

-- 23.	Replace a portion of a string using the INSERT() function.
SELECT INSERT('Hello World', 7, 5, 'MySQL') AS result;

-- 24.	Join multiple values using the CONCAT_WS() function.
SELECT CONCAT_WS(' ', 'Sakshi', 'Shelge', 'Pune') AS result;

-- 25.	Extract the text before and after a delimiter using the SUBSTRING_INDEX() function.
SELECT SUBSTRING_INDEX('Sakshi-Pune', '-', 1) AS before_delimiter;
SELECT SUBSTRING_INDEX('Sakshi-Pune', '-', -1) AS after_delimiter;

-- 26.	Display a string enclosed in quotes using the QUOTE() function.
SELECT QUOTE('Hello World') AS quoted_text;

-- 27.	Convert a string into UTF-8 format using the CONVERT() function.
SELECT CONVERT('Hello World' USING utf8mb4) AS utf8_text;

-- 28.	Convert a character value into an integer using the CAST() function.
SELECT CAST('100' AS SIGNED) AS number_value;

-- 1.	Create another table named employees with appropriate text columns.
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO employees (employee_name, department, city) VALUES
('Sakshi Shelge', 'IT', 'Pune'),
('Rahul Sharma', 'Sales', 'Mumbai'),
('Priya Patil', 'HR', 'Pune'),
('Amit Kumar', 'Finance', 'Delhi'),
('Neha Joshi', 'IT', 'Nashik'),
('Ravi Singh', 'Sales', 'Pune'),
('Pooja More', 'HR', 'Mumbai'),
('Kiran Shah', 'IT', 'Delhi'),
('Sneha Pawar', 'Finance', 'Pune'),
('Akash Verma', 'Sales', 'Nashik');

SELECT * FROM employees;
-- 2.	Apply any five different string functions on the employee data and display the results.
SELECT 
    employee_name,
    UPPER(employee_name) AS uppercase_name,
    LOWER(employee_name) AS lowercase_name,
    LENGTH(employee_name) AS name_length,
    LEFT(employee_name, 4) AS first_4_characters,
    REVERSE(employee_name) AS reversed_name
FROM employees;