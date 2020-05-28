ProjectEmployeesII.sql


Write an SQL query that reports all the projects that have the most employees.

select project_id 
from Employees 
having count(employee_id) = (select count(distinct employee_id) from Employees order by 1 desc limit 1)

