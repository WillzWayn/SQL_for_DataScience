Top Travellers

Users
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+
id is the primary key for this table.
name is the name of the user.

Table: Rides
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| user_id       | int     |
| distance      | int     |
+---------------+---------+
id is the primary key for this table.
city_id is the id of the city who bought the product "product_name".
Write an SQL query to report the distance travelled by each user.

Return the result table ordered by travelled_distance in descending order, if two or more users travelled the same distance, order them by their name in ascending order.

SOLUTION
--------
select name, sum(if(isnull(distance), 0, distance)) as distance_travelled
from Users left join Rides
on Users.id = Rides.user_id
group by Users.id
order by distance_travelled desc, name