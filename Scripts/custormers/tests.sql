-- ==========================================
-- Data Validation and Cleaning Checks for Customers Table
-- Each query checks or corrects specific issues in the table
-- ==========================================

-- Check for missing customer IDs
SELECT *
FROM customers
WHERE customer_id IS NULL;

-- Check for duplicate customer IDs
SELECT 
	customer_id,
	COUNT(*) 
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Check for improperly formatted first names
SELECT first_name
FROM customers
WHERE TRIM(first_name) != first_name
   OR first_name != INITCAP(TRIM(first_name));

-- Check for improperly formatted last names
SELECT last_name
FROM customers
WHERE TRIM(last_name) != last_name
   OR last_name != INITCAP(TRIM(last_name));

-- List all distinct gender values
SELECT DISTINCT gender
FROM customers;

-- Preview standardized gender values
SELECT DISTINCT 
	CASE
		WHEN UPPER(TRIM(gender)) IN ('M', 'MALE') THEN 'Male'
		WHEN UPPER(TRIM(gender)) IN ('F', 'FEMALE') THEN 'Female'
		ELSE 'n/a'
	END AS cleaned_gender
FROM customers;

-- Find invalid or missing emails
SELECT email
FROM customers
WHERE email !~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
	OR email IS NULL;

-- Preview cleaned email values
SELECT email,
       CASE
           WHEN TRIM(email) ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' THEN TRIM(email)       
           ELSE 'n/a'             
       END AS cleaned_email
FROM customers;

-- Check for invalid phone numbers (US format example)
SELECT phone_number
FROM customers
WHERE phone_number !~ '^\+1-\d{3}-\d{3}-\d{4}$';

-- Check for invalid or missing addresses
SELECT address
FROM customers
WHERE address IS NULL
   OR TRIM(address) = ''
   OR LENGTH(TRIM(address)) < 5
   OR TRIM(address) ~ '^\d+$'
   OR UPPER(TRIM(address)) IN ('N/A', 'UNKNOWN', 'NONE');

-- Check for invalid or missing city values
SELECT city
FROM customers
WHERE city IS NULL
   OR TRIM(city) = ''
   OR LENGTH(TRIM(city)) < 3
   OR TRIM(city) ~ '^\d+$'
   OR UPPER(TRIM(city)) IN ('N/A', 'UNKNOWN', 'NONE');

-- List all distinct countries
SELECT DISTINCT country
FROM customers;

-- Preview standardized country names
SELECT DISTINCT
	country,
	CASE
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
	END AS cleaned_country
FROM customers;

-- Check for invalid or missing birthdates
SELECT birthdate
FROM customers
WHERE birthdate IS NULL
    OR birthdate > CURRENT_DATE
    OR birthdate < DATE '1900-01-01';

-- Check for invalid or missing ages
SELECT age
FROM customers
WHERE age IS NULL
    OR age < 0
    OR age > 120;
