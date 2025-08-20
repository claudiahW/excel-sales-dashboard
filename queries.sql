-- 1. Sales by Region
SELECT region, SUM(sales) AS total_sales
FROM sales
GROUP BY region;

-- 2. Profit by Product
SELECT product, SUM(profit) AS total_profit
FROM sales
GROUP BY product
ORDER BY total_profit DESC;

-- 3. Top 10 Products by Profit
SELECT product, SUM(profit) AS total_profit
FROM sales
GROUP BY product
ORDER BY total_profit DESC
LIMIT 10;

-- 4. Monthly Sales Trends
SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(sales) AS total_sales
FROM sales
GROUP BY month
ORDER BY month;

-- 5. Top 10 Customers by Sales
SELECT customer_name, SUM(sales) AS total_sales
FROM sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;
