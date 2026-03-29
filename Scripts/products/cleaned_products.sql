-- ==========================================
-- Create cleaned_products table
-- Purpose: Standardizes and cleans data from the products table
-- ==========================================

CREATE TABLE cleaned_products AS
SELECT
	product_id,                        
	INITCAP(TRIM(product_name)) AS product_name,       
	INITCAP(TRIM(product_category)) AS product_category, 
	price,                              
	cost_price,                         
	INITCAP(TRIM(supplier)) AS supplier 
FROM
	products;                       
