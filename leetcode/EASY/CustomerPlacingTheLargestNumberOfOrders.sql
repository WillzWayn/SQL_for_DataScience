CustomerPlacingTheLargestNumberOfOrders

Query the customer_number from the orders table for the customer who has placed the largest number of orders.

It is guaranteed that exactly one customer will have placed more orders than any other customer.

The orders table is defined as follows:

| Column            | Type      |
|-------------------|-----------|
| order_number (PK) | int       |
| customer_number   | int       |
| order_date        | date      |
| required_date     | date      |
| shipped_date      | date      |
| status            | char(15)  |
| comment           | char(200) |


1. Quick solution but fails when multiple customers have same order count. In such case, following query will give only one customer_name

select customer_number
from orders
group by customer_number
order by count(order_number)
limit 1

2. 

select o.customer_name
from
	(
		select customer_name, count(order_number) as order_count
	 	from orders
	 	group by customer_name
	) as o
having order_count = max(order_count)