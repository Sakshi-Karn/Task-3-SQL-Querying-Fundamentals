DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    row_id        SERIAL PRIMARY KEY,
    order_id      VARCHAR(20),
    order_date    DATE,
    ship_date     DATE,
    ship_mode     VARCHAR(50),
    customer_id   VARCHAR(20),
    country       VARCHAR(50),
    city          VARCHAR(50),
    state         VARCHAR(50),
    postal_code   VARCHAR(20),
    region        VARCHAR(20),
    product_id    VARCHAR(20),
    sales         NUMERIC(10,2),
    quantity      INTEGER,
    discount      NUMERIC(5,2),
    profit        NUMERIC(10,2)
);




select * from orders;

drop table if exists customers;
CREATE TABLE customers (
    customer_id   VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100),
    segment       VARCHAR(50)
);


select * from customers;

drop table if exists products;
CREATE TABLE products (
    product_id   VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(255),
    category     VARCHAR(50),
    sub_category VARCHAR(50)
);


select * from products;

--1 . Get all customer names
select customer_name from customers;

--2.Find orders shipped using “Second Class”
select * from orders
where ship_mode='Second Class';

--3.. Sort orders by highest sales
select * from orders
order by sales DESC; 

--4.Count how many orders each customer has
select customer_id, Count(*) As total_orders
from orders
Group by customer_id
order by total_orders Desc;

--5.Total sales by category (JOIN with products)
select p.category, SUM(o.sales) as total_sales
from orders o
inner join products p
On o.product_id=p.product_id
Group by p.category
order by total_sales Desc;

--6.Get top 5 most profitable products
SELECT p.product_name, SUM(o.profit) AS total_profit
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_profit DESC
LIMIT 5;

--7.Monthly sales
SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales) AS monthly_sales
FROM orders
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY month;

--8.Find orders with profit < 0 (loss cases)
SELECT *
FROM orders
WHERE profit < 0;

--9. Join orders + customers + products (full useful dataset)
SELECT 
    o.order_id,
    c.customer_name,
    p.product_name,
    o.sales,
    o.quantity,
    o.profit
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;

-- 10.Find most frequently ordered product
SELECT p.product_name, COUNT(*) AS order_count
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY order_count DESC
LIMIT 1;

--11.. Average discount by category
SELECT p.category, AVG(o.discount) AS avg_discount
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category;