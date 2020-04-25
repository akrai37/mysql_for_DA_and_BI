#EXERCISE-1
drop function if exists f_emp_avg_salary;

delimiter $$
create function f_emp_avg_salary(f_emp_no int) returns decimal(10, 2) #here we have no OUT parameters to define between the parentheses after the object’s name.all parameters are IN, and since this is well known, you need not explicitly indicate it with the word, ‘IN’
deterministic  NO SQL READS SQL DATA #it is neccessary to tell mysql that the result of this fn query result is deterministic instead of non-deterministic otherwise it will show error.
begin
declare f_avg_salary decimal(10,2); #we have to declare the returned variable(s) here. we will use the keyword DECLARE instead of SET which was used for 'procedure'.

select avg(s.salary) into f_avg_salary 
from salaries s
where s.emp_no=f_emp_no;

return f_avg_salary; #unlike 'procedure', we have to return the 'variable' like this.return doesnt have (s) here.
end $$
delimiter ;

select f_emp_avg_salary('10003'); #we cannot call a function! we can select it, indicating an input value within parentheses.
#note:- 1.if you need to obtain more than one value as a result of a calculation, you are better off using a 'procedure'.
#note:- 2.if you want just one value to be returned, then you can use a 'function'.
#note:- 3. a 'procedure' can be used for INSERT,DELETE AND UPDATE statement but not 'functions'.



#EXERCISE-2 Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, and returns the salary from the newest contract of that employee.
drop function if exists f_emp_info;

delimiter $$
create function f_emp_info(f_first_name varchar(40),f_last_name varchar(40)) returns decimal(10,2)
deterministic  NO SQL READS SQL DATA
begin
declare f_max_from_date date; 
declare f_latest_salary decimal(10, 2);

select max(s.from_date) into f_max_from_date
from salaries s
join employees e 
on s.emp_no= e.emp_no
where first_name=f_first_name and last_name=f_last_name;

select s.salary into f_latest_salary
from salaries s
join employees e 
on s.emp_no= e.emp_no
where first_name=f_first_name and last_name=f_last_name and from_date= f_max_from_date; #'having' clause didnt work here. the main reason- You cannot compare the date to itself. In order to do that you must first extract the max() date in different variable and then use it like I tried to.

return f_latest_salary;
end $$
delimiter ;

select f_emp_info('aruna','journel');






#Alternate solution of exercise -2 (just look for the logic)
CREATE DEFINER=`root`@`localhost` FUNCTION `f_emp_info`(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)
begin
    declare v_salary decimal(10, 2);
    select s.salary into v_salary from employees e join salaries s on s.emp_no = e.emp_no
    where e.first_name = p_first_name and e.last_name = p_last_name
    group by from_date desc limit 1;
    return v_salary;




#another alternate sol. of exercise 2 (just look for the logic)
SELECT 
    s.salary
INTO last_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date IN (SELECT 
            MAX(s.from_date)
        FROM
            salaries s
        WHERE
            s.emp_no = e.emp_no);










 