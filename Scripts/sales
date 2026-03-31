-- =========================================================
-- Create the 'sales' table by joining orders, customers,
-- and products. This table is used for building the 
-- Sales Overview dashboard in Power BI.
-- =========================================================

CREATE TABLE sales AS 
SELECT 
    o.order_id,                   -- Order identifier
    p.product_id,                 -- Product identifier
    c.customer_id,                -- Customer identifier
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,  -- Full customer name
    c.country,                    -- Customer country
    o.order_date,                 -- Date of the order
    p.product_name,               -- Name of the product
    p.product_category,           -- Category of the product
    o.quantity,                   -- Quantity ordered
    o.unit_price,                 -- Price per unit
    o.total_sale,                 -- Total sale amount
    o.order_status,               -- Status of the order
    o.order_type                  -- Type of order (online/in-store)
FROM
    cleaned_orders AS o
LEFT JOIN cleaned_customers AS c
    ON o.customer_id = c.customer_id    -- Link orders to customers
LEFT JOIN cleaned_products AS p
    ON o.product_id = p.product_id;     -- Link orders to products
