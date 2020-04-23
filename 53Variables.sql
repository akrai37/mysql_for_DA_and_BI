#EXERCISE-1 
drop procedure if exists emp_avg_salary_out;

delimiter $$
create procedure emp_avg_salary_out(in p_input_value int, out p_avg_salary decimal(10,2)) #out parameter-it will represent the variable containing the OUTPUT VALUE of the operation executed by the query of the stored procedure.
begin
select avg(s.salary) into p_avg_salary from employees e
join salaries s on e.emp_no= s.emp_no
where e.emp_no=p_input_value;
end $$
delimiter ;

set @v_avg_salary= '0';
call emp_avg_salary_out('10004', @v_avg_salary);
select @v_avg_salary;
#note:-The OUT parameter brings out a value from the operation, so to speak. The VARIABLES are able to store that value and thus can be used for further calculations.


#EXERCISE-2
drop procedure if exists emp_info;

delimiter $$
create procedure emp_info(in p_first_name varchar(40), in p_last_name varchar(40), out p_emp_no varchar(40))
begin
select e.emp_no into p_emp_no
from employees e 
where 
e.first_name=p_first_name and 
e.last_name= p_last_name;
end $$
delimiter ;

set @v_emp_no= 0;
call emp_info('aruna','journel',@v_emp_no);
select @v_emp_no;

#VARIABLE in SQL, does the same job as it is designed to do in any other programming language (stores a particular value). 
#It is necessary to use VARIABLE if there is OUT parameter in the 'procedure' in order to store the OUT value or the returned value while calling the 'procedure'.
 

