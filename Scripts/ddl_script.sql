-- ==============================================
-- WARNING: This script will DROP tables if they exist!
-- Make sure you do not have important data in these tables 
-- before running it, as it will be permanently deleted.
--
-- PostgreSQL-based DDL Script
-- Purpose: Creates tables for an e-commerce database including 
-- customers, employees, products, and orders. It drops existing tables first.
-- ==============================================

-- Drop tables if they already exist (data will be lost)
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;

-- Table: customers
-- Stores customer information
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    email VARCHAR(100),
    phone_number VARCHAR(30),
    address VARCHAR(255),
    city VARCHAR(50),
    country VARCHAR(100),
    birthdate DATE,
    age INT
);

-- Table: employees
-- Stores employee details
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    gender VARCHAR(10),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

-- Table: products
-- Stores product details including cost and selling price
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_category VARCHAR(50),
    price DECIMAL(10,2),
    cost_price DECIMAL(10,2),
    supplier VARCHAR(100)
);

-- Table: orders
-- Stores orders and links customers, products, and employees
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    employee_id INT,
    order_date DATE,
    order_type VARCHAR(20),
    quantity INT,
    unit_price DECIMAL(10,2),
    total_sale DECIMAL(10,2),
    order_status VARCHAR(20)
);
