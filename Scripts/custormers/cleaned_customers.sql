-- ================================================
-- Query: Create cleaned_customers table
-- Purpose: Standardizes and cleans data from the customers table
-- ================================================

CREATE TABLE cleaned_customers AS
SELECT
	customer_id,          
	first_name,            
	last_name,             
	CASE                   
		WHEN UPPER(TRIM(gender)) IN ('M', 'MALE') THEN 'Male'
		WHEN UPPER(TRIM(gender)) IN ('F', 'FEMALE') THEN 'Female'
		ELSE 'n/a'
	END AS gender,
	CASE                   -- Validate email format
        WHEN TRIM(email) ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' THEN TRIM(email)
        ELSE 'n/a'
    END AS email,
	phone_number,          
	address,               
	city,                  
	CASE                   -- Standardize country names
		WHEN UPPER(TRIM(country)) IN ('UK') THEN 'United Kingdom'
		WHEN UPPER(TRIM(country)) IN ('UNITED STATES', 'US', 'USA') THEN 'United States'
		WHEN UPPER(TRIM(country)) IN ('SPAIN') THEN 'Spain'
		WHEN UPPER(TRIM(country)) IN ('MEXICO') THEN 'Mexico'
		WHEN UPPER(TRIM(country)) IN ('AU', 'AUSTRALIA') THEN 'Australia'
		WHEN UPPER(TRIM(country)) IN ('CHINA', 'CN') THEN 'China'
		WHEN UPPER(TRIM(country)) IN ('CA', 'CANADA') THEN 'Canada'
		WHEN UPPER(TRIM(country)) IN ('FRANCE', 'FR') THEN 'France'
		WHEN UPPER(TRIM(country)) IN ('INDIA', 'IN') THEN 'India'
		WHEN UPPER(TRIM(country)) IN ('ITALY') THEN 'Italy'
		WHEN UPPER(TRIM(country)) IN ('JP', 'JAPAN') THEN 'Japan'
		WHEN UPPER(TRIM(country)) IN ('BRAZIL') THEN 'Brazil'
		WHEN UPPER(TRIM(country)) IN ('GERMANY') THEN 'Germany'
		WHEN UPPER(TRIM(country)) IN ('NIGERIA') THEN 'Nigeria'
		ELSE 'n/a'
	END AS country,
	birthdate,            
	age                    
FROM 
	customers;             
