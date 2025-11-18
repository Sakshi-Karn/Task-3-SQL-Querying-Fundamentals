This project is a small-scale SQL-based data analysis assignment built on a subset of the Superstore dataset.
To keep the exercise focused and manageable, only 50 rows of data were used across the orders_clean, customers, and products tables.

The database includes three tables:

orders_clean – Sales transactions

customers – Customer information

products – Product catalog

These tables were cleaned, standardized, and modeled to support filtering, aggregation, and relational queries.

Basic Queries

Selected specific columns.

Filtered using WHERE (e.g., by region, profit < 0, high discount).

Sorted using ORDER BY sales DESC.

Limited results using LIMIT.

Aggregations

Aggregated order-level metrics:

SUM(sales), SUM(profit), AVG(discount), COUNT(order_id)

Grouped results by:

Category

Sub-category

Customer segment

Region

Identified top- and bottom-performing products and customers.

Joins

Performed relational analysis through:

INNER JOIN orders_clean WITH customers

INNER JOIN orders_clean WITH products
Used to answer:

Sales by category

Profit by segment

Quantity sold per product
