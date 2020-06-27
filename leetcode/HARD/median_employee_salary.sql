with contiguousCTE as (
  select period_state, dates,
  min(dates) over(partition by period_state,dates order by period_state, dates),
  max(dates) over(partition by period_state,dates order by period_state, dates),
  lead(period_state,1) over(partition by period_state order by dates),
  lag(period_state) over(partition by period_state order by dates)

  from
  (
    (
    select fail_date as dates, 'missing' as period_state
    from Failed
    where fail_date between '2019-01-01' and '2019-01-31'
  )
  union
  (
    select success_date as dates, 'present' as period_state
    from Succeeded
    where success_date between '2019-01-01' and '2019-01-31'
  )
    ) t
  order by dates
) 

select *
from contiguousCTE