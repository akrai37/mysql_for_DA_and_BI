drop procedure if exists emp_salary;

delimiter $$
create procedure emp_salary(in p_emp_no int) #note:- stored procedures can take an input value and then use it in the query, or queries, written in the body of the procedure
begin
select e.first_name, e.last_name, avg(s.salary) # #out parameter-it will represent the variable containing the OUTPUT VALUE of the operation executed by the query of the stored procedure.
begin
from employees e
join salaries s on e.emp_no= s.emp_no
where e.emp_no=p_emp_no;
end $$
delimiter ;

call emp_salary();


