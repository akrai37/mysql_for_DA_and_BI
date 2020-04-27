drop procedure if exists task_4 ;

delimiter $$
create procedure task_4(in range_1 float, in range_2 float)
begin
select d.dept_no, d.dept_name, e.gender, avg(s.salary) as avg_salary
from t_salaries s 
join
t_employees e on s.emp_no=e.emp_no
join 
t_dept_emp de on e.emp_no=de.emp_no
join
t_departments d on de.dept_no= d.dept_no
where 
s.salary between range_1 and range_2
group by e.gender, d.dept_no
order by d.dept_no, e.gender;
end $$
delimiter ;


 