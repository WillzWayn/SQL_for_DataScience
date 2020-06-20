select week_gap as visited_on, 
       total_amount,
       average_amount
from 
(
  select visited_on, visited_on + interval '6' day as week_gap,
 amount,
 sum(amount) over(order by visited_on rows between current row and 6 following) as total_amount,
 avg(amount) over(order by visited_on rows between current row and 6 following) as average_amount
  from Customer
) t
where visited_on <= (select max(visited_on)-interval '6' day 
                   from Customer)