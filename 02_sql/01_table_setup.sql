USE amazon_db;

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;

DESC customers;
DESC orders;
DESC products;


 --MERGED TABLE


SELECT
    c.customer_id,
    c.name,
    c.email,
    c.phone,
    c.city,
    c.state,
    c.gender,
    c.age,
    c.total_orders,
    o.order_id,
    o.category,
    o.quantity,
    o.total_amount,
    o.payment_mode,
    p.product_id,
    p.product_name,
    p.unit_price,
    p.cost_price,
    p.profit_margin,
    p.stock_quantity,
    (o.quantity * p.unit_price) AS sales,
    (o.quantity * p.cost_price) AS cost,
    (
        (o.quantity * p.unit_price)
        -
        (o.quantity * p.cost_price)
    ) AS profit
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id;

SELECT * FROM merged_table;
