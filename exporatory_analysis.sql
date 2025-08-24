-- Exploratory SQL Analysis for Sales Database
-- ===========================================

-- 1. Preview first 10 rows
SELECT *
FROM sales
LIMIT 10;

-- 2. Total number of rows
SELECT COUNT(*) AS total_rows
FROM sales;

-- 3. Total sales and profit
SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales;

-- 4. Sales by region
SELECT region,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

-- 5. Sales by customer segment
SELECT segment,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit
FROM sales
GROUP BY segment
ORDER BY total_sales DESC;

-- 6. Top 10 customers by sales
SELECT customer_name,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit
FROM sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- 7. Monthly sales trend
SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit
FROM sales
GROUP BY month
ORDER BY month;

-- 8. Sales by product category
SELECT category,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_sales DESC;

-- 9. Sales by sub-category
SELECT sub_category,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit
FROM sales
GROUP BY sub_category
ORDER BY total_sales DESC;

-- 10. Profit margin by category
SELECT category,
       ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_percent
FROM sales
GROUP BY category
ORDER BY profit_margin_percent DESC;

-- 11. Top 10 products by profit
SELECT product_name,
       SUM(profit) AS total_profit
FROM sales
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- 12. Worst 10 products (loss-making)
SELECT product_name,
       SUM(profit) AS total_profit
FROM sales
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;

-- 13. Sales by shipping mode
SELECT ship_mode,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit
FROM sales
GROUP BY ship_mode
ORDER BY total_sales DESC;

-- 14. Yearly sales trend
SELECT DATE_PART('year', order_date) AS year,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit
FROM sales
GROUP BY year
ORDER BY year;

-- 15. Top regions by profit margin
SELECT region,
       ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_percent
FROM sales
GROUP BY region
ORDER BY profit_margin_percent DESC;
