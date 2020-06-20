restaurant_growth.sql

select a_visited_on, sum(b_amount), avg(b_amount)
from
(
  select visited_on as a_visited_on, sum(amount) as a_amount
  from Customer 
  group by visited_on
) a
left join 
(
  select visited_on as b_visited_on,
         sum(amount) as b_amount
  from Customer 
  group by visited_on
) b
on datediff(a_visited_on, b_visited_on) BETWEEN 0 AND 6 
group by avisited_on
having count(avisited_on) = 7