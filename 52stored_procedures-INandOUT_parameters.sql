drop procedure if exists emp_avg_salary_out;

delimiter $$
create procedure emp_avg_salary_out(in p_input_value int, out p_avg_salary decimal(10,2)) #out parameter-it will represent the variable containing the OUTPUT VALUE of the operation executed by the query of the stored procedure.
begin
select avg(s.salary) into p_avg_salary #unfortunately ,we cannot call other columns with this query like e.first_name,e.last_name. It is showing error.
from employees e
join salaries s on e.emp_no= s.emp_no
where e.emp_no=p_input_value;
end $$
delimiter ;

call emp_avg_salary_out(10001);
#note:- 1.every time you create a procedure containing both an IN and an OUT parameter, remember that you must use the SELECT-INTO structure in the query of this object’s body!


#EXERCISE
#Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.

drop procedure if exists emp_info;

delimiter $$
create procedure emp_info(in p_first_name varchar(40), in p_last_name varchar(40), out p_emp_no varchar(40))
begin
select e.emp_no into p_emp_no
from employees e where 
e.first_name=p_first_name and 
e.last_name= p_last_name;
end $$
delimiter ;

call emp_info('parto','bamford');#for some reason it is not working .
#note:- remember, 3 lines before the SELECT statement starts and 2 lines after the SELECT statement ends.
