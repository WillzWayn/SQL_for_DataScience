select t.Request_at as "Day", 
       round(sum(case when Status like 'cancelled%' then 1 else 0 end)/count(*), 2)as "Cancellation Rate"
from Trips t join Users c
on c.Users_Id = t.Client_Id 
join Users d
on d.Users_Id = t.Driver_Id
where c.Banned = 'No' and d.Banned = 'No'
and t.Request_at between '2013-10-01' and '2013-10-03'
group by t.Request_at
order by t.Request_at


select t.Request_at as "Day",
round(sum(case when Status like 'cancelled%' then 1 else 0 end)/count(*), 2)as "Cancellation Rate"
from Trips t
where (t.Request_at between '2013-10-01' and '2013-10-03')
and t.Client_Id IN (select Users_Id
                      from Users 
                      where Banned = 'No' and Role = 'client')
and t.Driver_Id IN (select Users_Id
                   from Users 
                   where Banned = 'No' and Role = 'driver')
group by t.Request_at