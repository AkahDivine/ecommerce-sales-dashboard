-- ==========================================
-- Data Validation and Cleaning Checks for Employees Table
-- Each query checks or previews issues in the employees table
-- ==========================================

-- Check for missing employee IDs
SELECT employee_id
FROM employees
WHERE employee_id IS NULL;

-- Check for duplicate employee IDs
SELECT employee_id,
	   COUNT(*) 
FROM employees
GROUP BY employee_id
HAVING COUNT(*) > 1;

-- Check for missing employee names
SELECT employee_name
FROM employees
WHERE employee_name IS NULL; 

-- Check for improperly formatted employee names
SELECT employee_name
FROM employees
WHERE TRIM(employee_name) != employee_name
	OR INITCAP(employee_name) != employee_name;

-- Preview cleaned employee names
SELECT employee_name,
	   INITCAP(TRIM(employee_name)) AS cleaned_employee_name
FROM employees;

-- Check for missing gender values
SELECT gender
FROM employees
WHERE gender IS NULL;

-- List all distinct gender values
SELECT DISTINCT gender
FROM employees;

-- Preview standardized gender values
SELECT DISTINCT
	gender,
	CASE
		WHEN UPPER(TRIM(gender)) IN ('FEMALE', 'F') THEN 'Female'
		WHEN UPPER(TRIM(gender)) IN ('MALE', 'M') THEN 'Male'
		ELSE 'n/a'
	END AS cleaned_gender
FROM employees;

-- Check for missing department values
SELECT department
FROM employees
WHERE department IS NULL;

-- List all distinct departments
SELECT DISTINCT department
FROM employees;

-- Preview standardized department values
SELECT DISTINCT
	department,
	CASE
		WHEN UPPER(TRIM(department)) = 'SALES' THEN 'Sales'
		WHEN UPPER(TRIM(department)) = 'OPERATIONS' THEN 'Operations'
		WHEN UPPER(TRIM(department)) = 'FINANCE' THEN 'Finance'
		WHEN UPPER(TRIM(department)) = 'IT' THEN 'Information Technology'
		WHEN UPPER(TRIM(department)) = 'HR' THEN 'Human Resources'
		WHEN UPPER(TRIM(department)) = 'MANAGER' THEN 'Manager'
		ELSE 'n/a'
	END AS cleaned_department
FROM employees;

-- Check for invalid or missing salaries
SELECT salary
FROM employees
WHERE salary IS NULL
	OR salary <= 0;

-- Check for invalid or missing hire dates
SELECT hire_date
FROM employees
WHERE hire_date IS NULL
   	OR hire_date > CURRENT_DATE
   	OR hire_date < DATE '1990-01-01';
