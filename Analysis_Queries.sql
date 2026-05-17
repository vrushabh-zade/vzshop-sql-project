-- select * from customers;
-- select * from orders;
-- select * from order_items;
-- select * from products;

## Total Revenue 
select sum(amount) as total_revenue from payments;

## Revenue by Product
select p.product_name, sum(oi.quantity * p.price) as revenue
from order_items oi
join products p on oi.product_id = p.product_id
join orders o on oi.order_id = o.order_id
where o.order_status = "Delivered"
group by p.product_name
order by revenue desc;

## Top Customers by Spend
SELECT c.name,
       SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.name
ORDER BY total_spent DESC;

## Best Selling Products
SELECT p.product_name,
       SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

## Cancelled Orders Count
select count(*) as cancelled
from orders
where order_status = "Cancelled";

