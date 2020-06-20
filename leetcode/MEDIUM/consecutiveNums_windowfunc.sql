select Num as consecutiveNums
from (
  select Num, 
  (
    case when (
            (Num = lag(Num, 1)  over(order by Id))
            and 
            (Num  = lead(Num, 1) over(order by Id))
            )
      then Num else null
    end ) as threeTogether
   from Logs
) t1
where threeTogether is not null