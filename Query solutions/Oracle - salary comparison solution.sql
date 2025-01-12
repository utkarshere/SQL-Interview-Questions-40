SELECT * FROM employee_o;

with dept_avg_salary as(
 select department, Round(avg(case when id!= manager_id then salary else 0 end)*1.0,2) as dept_salary from employee_o 
 group by department
),
manager_salary as (
 select e.*, m.salary as manager_salary from employee_o e left join employee_o m on e.manager_id= m.id and e.id != e.manager_id
)
select e.department as dept, e.id as employee_id, e.salary as employee_salary, m.manager_salary as manager_salary,
d.dept_salary as dept_avg_sal 
from employee_o as e join manager_salary as m on e.id= m.id 
join dept_avg_salary as d on d.department= e.department order by e.department, e.salary desc;