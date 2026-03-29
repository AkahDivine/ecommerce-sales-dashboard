-- ==========================================
-- Data Validation and Cleaning Checks for Orders Table
-- Each query checks or previews potential issues in the orders table
-- ==========================================

-- Check for missing order IDs
SELECT *
FROM orders
WHERE order_id IS NULL;

-- Check for orders with invalid or missing customer IDs
SELECT o.*
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL
    OR o.customer_id IS NULL;

-- Check for orders with invalid or missing product IDs
SELECT o.*
FROM orders o
LEFT JOIN products p
    ON o.product_id = p.product_id
WHERE p.product_id IS NULL
   OR o.product_id IS NULL;

-- Check for orders with invalid or missing employee IDs
SELECT o.*
FROM orders o
LEFT JOIN employees e
    ON o.employee_id = e.employee_id
WHERE e.employee_id IS NULL
   OR o.employee_id IS NULL;

-- Check for missing or out-of-range order dates
SELECT *
FROM orders
WHERE order_date IS NULL
    OR order_date < DATE '2020-01-01'
    OR order_date > DATE '2022-12-31';

-- Check for missing order types
SELECT order_type
FROM orders
WHERE order_type IS NULL;

-- List all distinct order types
SELECT DISTINCT order_type
FROM orders;

-- Preview standardized order types
SELECT DISTINCT
	order_type,
	CASE
		WHEN UPPER(TRIM(order_type)) IN ('IN-STORE', 'INSTORE') THEN 'In-Store'
		WHEN UPPER(TRIM(order_type)) IN ('ONLINE') THEN 'Online'
		ELSE 'n/a'
	END AS cleaned_order_type
FROM orders;

-- Check for missing or negative quantities
SELECT quantity
FROM orders
WHERE quantity IS NULL
	OR quantity < 0;

-- Check for discrepancies between unit price in orders vs product price
SELECT 
	o.order_id,
    o.product_id,
    o.unit_price AS order_unit_price,
    p.price AS product_price
FROM orders AS o
JOIN products AS p
    ON o.product_id = p.product_id
WHERE o.unit_price != p.price
    OR o.unit_price IS NULL;

-- Check for incorrect or missing total sale values
SELECT total_sale
FROM orders
WHERE (quantity * unit_price) != total_sale
	OR total_sale IS NULL;

-- Check for missing order statuses
SELECT order_status
FROM orders
WHERE order_status IS NULL;

-- Preview standardized order statuses
SELECT DISTINCT
	order_status,
	CASE
		WHEN UPPER(TRIM(order_status)) = 'RETURNED' THEN 'Returned'
		WHEN UPPER(TRIM(order_status)) = 'COMPLETED' THEN 'Completed'
		WHEN UPPER(TRIM(order_status)) = 'CANCELLED' THEN 'Cancelled'
		ELSE 'n/a'
	END AS cleaned_order_status
FROM orders;
