#Customers Who Bought Products A and B but Not C

Table: Customers

+---------------------+---------+
| Column Name         | Type    |
+---------------------+---------+
| customer_id         | int     |
| customer_name       | varchar |
+---------------------+---------+
customer_id is the primary key for this table.
customer_name is the name of the customer.
Table: Orders

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| customer_id   | int     |
| product_name  | varchar |
+---------------+---------+
order_id is the primary key for this table.
customer_id is the id of the customer who bought the product "product_name".
Write an SQL query to report the customer_id and customer_name of customers
who bought products “A”, “B” but did not buy the product “C” since we want to recommend them buy this product.\
Return the result table ordered by customer_id.




select customer_id, customer_name 
from Customers c, Orders o 
where c.customer_id = o.customer_id
and o.product_name = "A" and o.product_name = "B" and o.product_name is not "C"


select * 
from Customers c
where c.customer_id in (select distinct customer_id from Customers where customer_id = 'A') and
	  c.customer_id in (select distinct customer_id from Customers where customer_id = 'B') and
	  c.customer_id not in (select distinct customer_id from Customers where customer_id = 'C')



