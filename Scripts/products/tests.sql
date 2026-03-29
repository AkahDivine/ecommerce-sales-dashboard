-- ==========================================
-- Data Validation and Cleaning Checks for Products Table
-- Each query checks or previews potential issues in the products table
-- ==========================================

-- Check for missing product IDs
SELECT product_id
FROM products
WHERE product_id IS NULL;

-- Check for duplicate product IDs
SELECT product_id,
       COUNT(*)
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

-- Check for improperly formatted product names
SELECT product_name
FROM products
WHERE INITCAP(product_name) != product_name
   OR TRIM(product_name) != product_name;

-- Preview cleaned product names
SELECT product_name,
       INITCAP(TRIM(product_name)) AS cleaned_product_name
FROM products;

-- List all distinct product categories
SELECT DISTINCT product_category
FROM products;

-- Check for improperly formatted product categories
SELECT product_category
FROM products
WHERE INITCAP(product_category) != product_category
   OR TRIM(product_category) != product_category;

-- Preview cleaned product categories
SELECT product_category,
       INITCAP(TRIM(product_category)) AS cleaned_product_category
FROM products;

-- List cleaned product categories (distinct)
SELECT DISTINCT
       INITCAP(TRIM(product_category)) AS cleaned_product_category
FROM products;

-- Check for invalid or missing prices
SELECT price
FROM products
WHERE price IS NULL
   OR price < 0
   OR price < cost_price;

-- Check for invalid or missing cost prices
SELECT cost_price
FROM products
WHERE cost_price IS NULL
   OR cost_price < 0
   OR cost_price > price;

-- Check for improperly formatted supplier names
SELECT supplier
FROM products
WHERE TRIM(supplier) != supplier
   OR INITCAP(supplier) != supplier;

-- Preview cleaned supplier names
SELECT INITCAP(TRIM(supplier)) AS cleaned_supplier
FROM products;
