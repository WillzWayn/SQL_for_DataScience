Table: Events

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| business_id   | int     |
| event_type    | varchar |
| occurences    | int     | 
+---------------+---------+
(business_id, event_type) is the primary key of this table.
Each row in the table logs the info that an event of some type occured at some business for a number of times.
Write an SQL query to find all active businesses.

An active business is a business that has more than one event type with occurences greater than the average occurences of that event type among all businesses.

The query result format is in the following example:

Events table:
create table Events
	(business_id int, event_type varchar(50), occurences int)
    ;
    
Insert into Events
values
	(1, 'reviews', 7),
	(3, 'reviews',  3),
	(1, 'ads', 11),
	(2,  'ads', 7),
    (3,  'ads', 6),
    (1, 'page views', 6),
    (2, 'page views', 12)
    ;
+-------------+ 
Average for 'reviews', 'ads' and 'page views' are (7+3)/2=5, (11+7+6)/3=8, (3+12)/2=7.5 respectively.
Business with id 1 has 7 'reviews' events (more than 5) and 11 'ads' events (more than



select e.business_id
from Events e join 
(
	select event_type, avg(occurences) as avg_occurences
	from Events
	group by event_type
) t
where e.event_type = t.event_type
having sum(case when occurences > avg_occurences then 1 else 0 end) > 1
