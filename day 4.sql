#Real life data_analyst_question in mnc or indian company
create database real_life;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT
);
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity) VALUES
(1,101,1,'2025-09-20',1),
(2,102,2,'2025-09-21',2),
(3,103,3,'2025-09-22',1),
(4,101,1,'2025-09-22',1),
(5,104,2,'2025-09-23',3),
(6,105,3,'2025-09-23',1),
(7,106,5,'2025-09-24',2),
(8,107,6,'2025-09-25',1),
(9,108,4,'2025-09-25',1),
(10,101,5,'2025-09-25',1),
(11,102,3,'2025-09-26',1),
(12,103,1,'2025-09-26',2),
(13,101,4,'2025-09-27',1),
(14,104,6,'2025-09-28',3),
(15,105,2,'2025-09-28',1),
(16,106,5,'2025-09-29',2),
(17,101,3,'2025-09-30',1),
(18,103,4,'2025-09-30',1),
(19,102,6,'2025-10-01',1),
(20,104,1,'2025-10-02',1);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Laptop', 60000),
(2, 'Mouse', 1000),
(3, 'Keyboard', 1500),
(4, 'Monitor', 12000),
(5, 'Headphones', 2500),
(6, 'Charger', 800);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);
INSERT INTO customers (customer_id, customer_name) VALUES
(101, 'Aman'),
(102, 'Raj'),
(103, 'Ravi'),
(104, 'Priya'),
(105, 'Neha'),
(106, 'Arjun'),
(107, 'Sneha'),
(108, 'Karan');

select * from customers;
select * from orders ;
select * from products;

 #Find the total revenue per customer
 
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(o.quantity * p.price) AS total_revenue
FROM
    orders o
        JOIN
    products p ON o.product_id = p.product_id
        JOIN
    customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id , c.customer_name
ORDER BY total_revenue DESC;
# Find the top 5 customers by total purchase amount. 
WITH customer_total AS (
SELECT c.customer_id,c.customer_name,SUM(o.quantity * p.price) AS total_purchase
    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    JOIN customers c ON o.customer_id = c.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT *
FROM customer_total
ORDER BY total_purchase DESC
LIMIT 5;


# Calculate average order value per customer.

SELECT 
    c.customer_id,
    c.customer_name,
    SUM(o.quantity * p.price) / count(distinct o.order_id) AS total_revenue
FROM
    orders o
        JOIN
    products p ON o.product_id = p.product_id
        JOIN
    customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id , c.customer_name
ORDER BY total_revenue DESC;