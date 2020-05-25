SalesAnalysisI.sql

Table: Product

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
| unit_price   | int     |
+--------------+---------+
product_id is the primary key of this table.
Table: Sales

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| seller_id   | int     |
| product_id  | int     |
| buyer_id    | int     |
| sale_date   | date    |
| quantity    | int     |
| price       | int     |
+------ ------+---------+
This table has no primary key, it can have repeated rows.
product_id is a foreign key to Product table.
Write an SQL query that reports the best seller by total sales price, If there is a tie, report them all.

The query result format is in the following example:



select seller_id
from Sales
group by seller_id
having sum(price) = (
	select sum(price) as sum_price
	from Sales
	group by seller_id
	order by sum(price) desc
	limit 1
)

