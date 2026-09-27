-- Revised portfolio queries; original internship submission is in original/.
-- PostgreSQL. Import the exact source CSV using pgAdmin after creating this table.
CREATE TABLE superstore_sales (
    order_id VARCHAR(50), order_date VARCHAR(20), ship_mode VARCHAR(30),
    customer_id VARCHAR(20), customer_name VARCHAR(100), segment VARCHAR(30),
    country VARCHAR(50), city VARCHAR(50), state VARCHAR(50), region VARCHAR(30),
    product_id VARCHAR(50), category VARCHAR(50), sub_category VARCHAR(50),
    product_name VARCHAR(255), sales NUMERIC(12,2), quantity INT,
    discount NUMERIC(5,2), profit NUMERIC(12,4)
);

-- 1. Top five customers by sales.
SELECT customer_id, customer_name, SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC NULLS LAST, customer_id, customer_name
LIMIT 5;

-- 2. Sales by region.
SELECT region, SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY region
ORDER BY total_sales DESC NULLS LAST, region;

-- 3. Average order value, not average line-item sales.
WITH order_totals AS (
    SELECT order_id, SUM(sales) AS order_sales
    FROM superstore_sales
    WHERE order_id IS NOT NULL
    GROUP BY order_id
)
SELECT ROUND(AVG(order_sales), 2) AS average_order_value
FROM order_totals;

-- 4. Top three categories by profit.
SELECT category, SUM(profit) AS total_profit
FROM superstore_sales
GROUP BY category
ORDER BY total_profit DESC NULLS LAST, category
LIMIT 3;

-- 5. Most common shipping mode by distinct orders, not shipments.
SELECT ship_mode, COUNT(DISTINCT order_id) AS distinct_orders
FROM superstore_sales
WHERE order_id IS NOT NULL AND ship_mode IS NOT NULL
GROUP BY ship_mode
ORDER BY distinct_orders DESC, ship_mode
LIMIT 1;
