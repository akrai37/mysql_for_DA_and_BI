#EXERCISE-1    #procedure is just like functions but unlike 'view' , we can manipulate it.
drop procedure if exists select_employees;

delimiter $$ #delimiter ends the query. The usual delimiter is ';', but, we are changing it here because we have to use ';' in between the query which will break our query/code without completion. 
create procedure select_employees() #this is the way to create procedure
begin 
select * from employees 
limit 1000;  #if we had used ';' as a delimiter, the query would have break here.
end $$ #we are ending our query here.
delimiter ; #we are again making ';' our delimiter.

call employees.select_employees(); #this and below are the methods to call a PROCEDURE.
call select_employees;


#EXERCISE-2
drop procedure if exists avg_salary_emp;

delimiter $$
create procedure avg_salary_emp()
begin
select avg(salary) from salaries;
end $$
delimiter ;

call employeees.avg_salary_emp();
call avg_salary_emp;
#note:- A view is intended to be regarded similarly to a table, it gives an overview of combination of data from different tables. A routine can also include different operations than just reading data, 
#it could also be used for other CRUD operations like insertion, updating or deleting data. You cannot do that with a view.
