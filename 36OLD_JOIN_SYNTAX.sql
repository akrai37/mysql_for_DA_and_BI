#NEW JOIN SNTAX
select e.emp_no,e.first_name,e.last_name,e.hire_date,m.dept_no
from employees e
inner join
dept_manager m
on e.emp_no=m.emp_no
order by m.emp_no;

#OLD JOIN SYNTAX
select e.emp_no,e.first_name,e.last_name,e.hire_date,m.dept_no
from employees e
,
dept_manager m
where e.emp_no=m.emp_no
order by m.emp_no;
