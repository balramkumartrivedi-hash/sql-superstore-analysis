--========================================================================-- TASK 2:
-- 1. Create table structure in pgadmin pannel to match CSV files columns
CREATE TABLE superstore_sales_new (
    order_id VARCHAR(50),
    order_date VARCHAR(20),
    ship_mode VARCHAR(30),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(30),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(30),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales NUMERIC(12, 2),
    quantity INT,
    discount NUMERIC(5, 2),
    profit NUMERIC(12, 4)
);

-- 2. Import raw CSV data rows into the table
COPY superstore_sales
FROM 'C:\Users\Public\Superstore.csv' 
DELIMITER ',' 
CSV HEADER;

-- ====================================================================
-- DATA ANALYSIS & INSIGHT EXTRACTION
-- ====================================================================
-- Query 1: Top 5 Spending Customers
SELECT customer_id, customer_name, SUM(sales) AS total_Spent_amount_by_cust
FROM superstore_sales
GROUP BY customer_id, customer_name
ORDER BY SUM(sales) DESC
LIMIT 5;

-- Query 2: Total Sales by Region
SELECT region, SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY region
ORDER BY total_sales DESC;

-- Query 3: Average Order Value
SELECT ROUND(AVG(sales), 2) AS Average_Order_Value 
FROM superstore_sales;

-- Query 4: Top 3 Most Profitable Product Categories
SELECT category AS product_category, SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY category
ORDER BY total_sales DESC
LIMIT 3; 
-- Query 5: The Most Frequently Used Shipping Mode
SELECT ship_mode, COUNT(*) AS total_shipments
FROM superstore_sales
GROUP BY ship_mode
ORDER BY total_shipments DESC
LIMIT 1;
--========================================================================