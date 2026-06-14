USE amazon_db;

-- Total Sales
SELECT 
    ROUND(SUM(sales), 2) AS total_sales
FROM merged_table;

-- Total Profit
SELECT 
    ROUND(SUM(profit), 2) AS total_profit
FROM merged_table;

-- Average Profit Margin
SELECT 
    ROUND(AVG(profit_margin), 2) AS average_profit_margin
FROM merged_table;

-- Total Cost
SELECT 
    ROUND(SUM(cost), 2) AS total_cost
FROM merged_table;

-- Total Unique Customers
SELECT 
    COUNT(DISTINCT customer_id) AS unique_total_customer
FROM merged_table;

-- Total Unique Orders
SELECT 
    COUNT(DISTINCT order_id) AS unique_total_orders
FROM merged_table;

-- Average Discount Percentage
SELECT 
    ROUND(AVG(discount_percentage), 2) AS avg_discount_percentage
FROM merged_table;
