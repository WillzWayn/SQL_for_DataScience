Average Salary: Departments VS Company (Hard)
Given two tables below, write a query to display the comparison result ("higher" "lower" "same") of the average salary of employees a department to the companys average salary.

 

Table: salary
| id | employee_id | amount | pay_date   |
|----|-------------|--------|------------|
| 1  | 1           | 9000   | 2017-03-31 |
| 2  | 2           | 6000   | 2017-03-31 |
| 3  | 3           | 10000  | 2017-03-31 |
| 4  | 1           | 7000   | 2017-02-28 |
| 5  | 2           | 6000   | 2017-02-28 |
| 6  | 3           | 8000   | 2017-02-28 |
 

The employee_id column refers to the employee_id in the following table employee.
 

| employee_id | department_id |
|-------------|---------------|
| 1           | 1             |
| 2           | 2             |
| 3           | 2             |
 

So for the sample data above, the result is:
 

| pay_month | department_id | comparison  |
|-----------|---------------|-------------|
| 2017-03   | 1             | higher      |
| 2017-03   | 2             | lower       |
| 2017-02   | 1             | same        |
| 2017-02   | 2             | same        |

---------------------------------------------------------------------------------------------------------------------------------------------------

Using window function Postgres 9.6

---------------------------------------------------------------------------------------------------------------------------------------------------


select pay_month,
       department,
       (case when dept_avg = company_avg then 'same'
             when dept_avg > company_avg then 'higher'
             when dept_avg < company_avg then 'lower'
        else null end) as comparison
from        
(
  select distinct extract('month' from pay_date) as pay_month,
       department_id as department,
       sum(amount) over(partition by 
                        extract('month' from pay_date),department_id order by department_id) as dept_avg,
       sum(amount) over(partition by 
                        extract('month' from pay_date) order by department_id) as company_avg
  from salary s join employee e
  on s.employee_id = e.employee_id
) t
order by pay_month desc


---------------------------------------------------------------------------------------------------------------------------------------------------

Using joins MySQL

---------------------------------------------------------------------------------------------------------------------------------------------------



select c.pay_month,
       department_id as department,
       (case when dept_avg = company_avg then 'same'
             when dept_avg > company_avg then 'higher'
             when dept_avg < company_avg then 'lower'
        else null end) as comparison
from 
(
  select date_format(pay_date, '%Y-%m') as pay_month,
         sum(amount) as company_avg
  from salary s
  group by date_format(pay_date, '%Y-%m')
) c
join
(
  select date_format(pay_date, '%Y-%m') as pay_month,
         e.department_id,
         sum(amount) as dept_avg
  from salary s, employee e
  where s.employee_id = s.employee_id
  group by date_format(pay_date, '%Y-%m'),
         e.department_id
) d
on c.pay_month = d.pay_month
order by 1 desc
