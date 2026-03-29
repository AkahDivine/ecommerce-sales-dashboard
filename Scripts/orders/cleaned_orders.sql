-- ==========================================
-- Create cleaned_orders table
-- Purpose: Standardizes and cleans data from the orders table
-- ==========================================

CREATE TABLE cleaned_orders AS 
SELECT
	order_id,            
	customer_id,         
	product_id,          
	employee_id,         
	order_date,          
	CASE                 
		WHEN UPPER(TRIM(order_type)) IN ('IN-STORE', 'INSTORE') THEN 'In-Store'
		WHEN UPPER(TRIM(order_type)) IN ('ONLINE') THEN 'Online'
		ELSE 'n/a'
	END AS order_type,
	quantity,            
	unit_price,          
	total_sale,          
	CASE                 
		WHEN UPPER(TRIM(order_status)) = 'RETURNED' THEN 'Returned'
		WHEN UPPER(TRIM(order_status)) = 'COMPLETED' THEN 'Completed'
		WHEN UPPER(TRIM(order_status)) = 'CANCELLED' THEN 'Cancelled'
		ELSE 'n/a'
	END AS order_status
FROM
	orders;             
