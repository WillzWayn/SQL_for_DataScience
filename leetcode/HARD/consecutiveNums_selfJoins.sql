
drop table if exists logs;
create table logs(id int, Num varchar);
insert into logs values
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(8, 3),
(9, 2),
(10, 3);



select a.Num as consecutiveNums
from logs a, logs b, logs c
where a.Num = b.Num and b.Num = c.Num 
and b.Id = a.Id + 1 and c.Id = b.Id + 1