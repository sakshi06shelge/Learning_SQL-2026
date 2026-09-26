-- 1. Create database
CREATE DATABASE numeric_functions_practice;

-- 2. Select database
USE numeric_functions_practice;

-- 3. Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    discount_percent DECIMAL(5,2)
);

-- 4. Insert 10 records
INSERT INTO products (product_name, price, discount_percent)
VALUES
('Laptop', 75500.75, 10),
('Mobile', 25999.49, 5),
('Tablet', 18500.80, 8),
('Monitor', 12499.55, 10),
('Keyboard', 1499.75, 5),
('Mouse', 799.40, 10),
('Printer', 15499.90, 12),
('Headphones', 2499.65, 15),
('Webcam', 3299.30, 7),
('Speaker', 4599.85, 10);

-- 5. Display all records
SELECT * FROM products;

-- 6. Calculate discounted price
SELECT
    product_name,
    price,
    discount_percent,
    price - (price * discount_percent / 100) AS discounted_price
FROM products;

-- 7. Round price to nearest whole number
SELECT product_name, price,
       ROUND(price) AS rounded_price
FROM products;

-- 8.	Display the product price rounded to one decimal place.
SELECT product_name, price,
       ROUND(price, 1) AS rounded_price
FROM products;

-- 9.	Display the product price rounded to the nearest ten.
SELECT product_name, price,
       ROUND(price, -1) AS rounded_price
FROM products;

-- 10.	Display the product price rounded to the nearest hundred.
SELECT product_name, price,
       ROUND(price, -2) AS nearest_hundred
FROM products;

-- 11.	Display the ceiling value and floor value of each product price.
SELECT product_name, price,
CEIL(price) AS ceiling_value,
FLOOR(price) AS floor_price
FROM products;

-- 12.	Display the square of each product price using the POWER() function.
SELECT product_name, price,
POWER(price, 2) AS square
FROM products;

-- 13.	Display the square root of each product price using the SQRT() function.
SELECT product_name, price,
SQRT(price) AS square_root
FROM products;

-- 14.	Display the remainder obtained after dividing the product price by 2 using the MOD() function.
SELECT product_name, price,
MOD(price, 2) AS remainder
FROM products;

-- 15.	Create another table named numeric_values with appropriate numeric columns.

CREATE TABLE numeric_values (
    id INT PRIMARY KEY AUTO_INCREMENT,
    number_value DECIMAL(10,4)
);

-- 16. Insert 10 records
INSERT INTO numeric_values (number_value)
VALUES
(25.6789),
(-15.4567),
(0),
(8.2345),
(-3.7891),
(12.5000),
(-20.1256),
(5.5555),
(100.9876),
(-7.2500);

SELECT * FROM numeric_values ;

-- 17.	Display the absolute value of each number using the ABS() function.
SELECT number_value,
ABS(number_value) AS absolute_value
FROM numeric_values;

-- 18.	Display whether each number is positive, negative, or zero using the SIGN() function.
SELECT number_value,
SIGN(number_value) AS sign_value
FROM numeric_values;

-- 19.	Display the remainder using both the MOD() function and the modulus operator.
SELECT number_value,
MOD(number_value, 2) AS mod_result,
number_value % 2 AS modulus_result
FROM numeric_values;

-- 20.	Display each number after truncating it to two decimal places.
SELECT number_value,
TRUNCATE(number_value, 2) AS truncated_value
FROM numeric_values;

-- 21.	Display each number after truncating it to zero decimal places.
SELECT number_value,
TRUNCATE(number_value, 0) AS truncated_value
FROM numeric_values;

-- 22.	Display each number rounded to two decimal places.
SELECT number_value,
ROUND(number_value, 2) AS rounded_value
FROM numeric_values;

-- 23.	Display each number rounded to the nearest integer.
SELECT number_value,
ROUND(number_value) AS rounded_integer
FROM numeric_values;

-- 24.	Display the exponential value of each number using the EXP() function.
SELECT number_value,
EXP(number_value) AS exponential_value
FROM numeric_values;

-- 25.	Display the natural logarithm, base-10 logarithm, and natural log value of each positive number.
SELECT number_value,
LN(number_value) AS natural_log,
LOG10(number_value) AS base10_log,
LOG(number_value) AS natural_log_value
FROM numeric_values
WHERE number_value > 0;

-- 26.	Convert degree values to radians and radian values to degrees.
SELECT number_value,
RADIANS(number_value) AS radians
FROM numeric_values;

SELECT number_value,
DEGREES(number_value) AS degrees
FROM numeric_values;

-- 27.	Display the sine, cosine, and tangent values of each number.
SELECT number_value,
       SIN(number_value) AS sine_value,
       COS(number_value) AS cosine_value,
       TAN(number_value) AS tangent_value
FROM numeric_values;

-- 28. Inverse sine, cosine, tangent
SELECT number_value,
       ASIN(number_value) AS inverse_sine,
       ACOS(number_value) AS inverse_cosine,
       ATAN(number_value) AS inverse_tangent
FROM numeric_values;

-- 29.	Display the angle between two numeric values using the ATAN2() function.
SELECT ATAN2(10, 5) AS angle
FROM numeric_values;

-- 30.	Display the value of PI() and calculate the result of raising a number to a given power using the POW() function.
SELECT
PI() AS pi_value,
POW(5, 3) AS power_result;

-- 31.	Generate random numbers using the RAND() function
SELECT
id,
RAND() AS random_number
FROM numeric_values;

-- 32.	Convert a decimal number to binary using the CONV() function.
SELECT CONV(25, 10, 2) AS binary_value;

-- 33.	Convert a decimal number to hexadecimal using the CONV() function.
SELECT CONV(255, 10, 16) AS hexadecimal_value;

-- 34.	Convert a hexadecimal value to decimal using the CONV() function.
SELECT CONV('FF', 16, 10) AS decimal_value;

-- 35.	Generate the checksum value of a string using the CRC32() function.
SELECT
    CRC32('Hello World') AS checksum_value;
    
-- 36.	Display the greatest value among multiple numbers using the GREATEST() function.
SELECT
    GREATEST(10, 25, 7, 40, 15) AS greatest_value;
-- 37.	Display the smallest value among multiple numbers using the LEAST() function.
SELECT
    LEAST(10, 25, 7, 40, 15) AS smallest_value;
-- 38.	Classify each number as positive, negative, or zero using the SIGN() function with a CASE expression.
SELECT
    number_value,
    SIGN(number_value) AS sign_value,
    CASE
        WHEN SIGN(number_value) = 1 THEN 'Positive'
        WHEN SIGN(number_value) = -1 THEN 'Negative'
        ELSE 'Zero'
    END AS number_type
FROM numeric_values;
-- 39.	Display the square root, rounded value, cube value, and logarithm of each number in a single query.
SELECT
    number_value,
    SQRT(ABS(number_value)) AS square_root,
    ROUND(number_value) AS rounded_value,
    POWER(number_value, 3) AS cube_value,
    LN(ABS(number_value)) AS logarithm
FROM numeric_values
WHERE number_value <> 0;
-- 40.	Apply any five different numeric functions on the numeric_values table and display the results.
    SELECT
    number_value,
    ABS(number_value) AS absolute_value,
    ROUND(number_value, 2) AS rounded_value,
    CEIL(number_value) AS ceiling_value,
    FLOOR(number_value) AS floor_value,
    SQRT(ABS(number_value)) AS square_root
FROM numeric_values;