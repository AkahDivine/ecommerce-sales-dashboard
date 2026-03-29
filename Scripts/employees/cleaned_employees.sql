-- ==========================================
-- Create cleaned_employees table
-- Purpose: Standardizes and cleans data from the employees table
-- ==========================================

CREATE TABLE cleaned_employees AS
SELECT
	employee_id,                         
	INITCAP(TRIM(employee_name)) AS employee_name, 
	CASE                                   
		WHEN UPPER(TRIM(gender)) IN ('FEMALE', 'F') THEN 'Female'
		WHEN UPPER(TRIM(gender)) IN ('MALE', 'M') THEN 'Male'
		ELSE 'n/a'
	END AS gender,
	CASE                                 
		WHEN UPPER(TRIM(department)) = 'SALES' THEN 'Sales'
		WHEN UPPER(TRIM(department)) = 'OPERATIONS' THEN 'Operations'
		WHEN UPPER(TRIM(department)) = 'FINANCE' THEN 'Finance'
		WHEN UPPER(TRIM(department)) = 'IT' THEN 'Information Technology'
		WHEN UPPER(TRIM(department)) = 'HR' THEN 'Human Resources'
		WHEN UPPER(TRIM(department)) = 'MANAGER' THEN 'Manager'
		ELSE 'n/a'
	END AS department,
	salary,                               
	hire_date                           
FROM
	employees;                             
