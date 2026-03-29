-- ==============================================
-- DML Script to Insert Data into Tables
-- PostgreSQL-based
--
-- WARNING: This script will TRUNCATE (empty) the tables before inserting data!
-- Make sure you do not have important data in these tables before running.
--
-- Purpose: Loads data into the e-commerce database tables: 
-- customers, employees, products, and orders.
-- Datasets can be found in the 'data' folder of the repository.
-- ==============================================

-- Clear existing data from customers table
TRUNCATE TABLE customers;

-- Load customer data from CSV file
COPY customers
FROM 'your_file_path_here'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

-- Clear existing data from orders table
TRUNCATE TABLE orders;

-- Load order data from CSV file
COPY orders
FROM 'your_file_path_here'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

-- Clear existing data from employees table
TRUNCATE TABLE employees;

-- Load employee data from CSV file
COPY employees
FROM 'your_file_path_here'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

-- Clear existing data from products table
TRUNCATE TABLE products;

-- Load product data from CSV file
COPY products
FROM 'your_file_path_here'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);
