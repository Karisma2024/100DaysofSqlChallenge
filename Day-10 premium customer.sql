--Write an SQL to find the list of premium customers along with the number of orders 
--placed by each of them.
SELECT * FROM orders

WITH CTE_orders AS(
SELECT 
(COUNT(order_id)*1.00/COUNT(DISTINCT(customer_name))*1.00) AS avg_order_count
FROM orders
)
SELECT customer_name,COUNT(order_id) AS no_of_orders FROM orders
GROUP BY customer_name
HAVING COUNT(order_id)> (SELECT avg_order_count FROM CTE_orders)


	