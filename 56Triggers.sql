##################################################################
#Refer to 55triggers-original for documentations.
##################################################################
#Q-Create a trigger that checks if the hire date of an employee is higher than the current date. If true, set this date to be the current date. Format the output appropriately (YY-MM-DD).
#1.from the given information in question, we can use both INSERT and UPDATE statements in order to solve it .

#EXERCISE-1 with INSERT statement
delimiter $$
create trigger update_date                         
before insert on employees
for each row 
begin
if new.hire_date > sysdate()
then set
new.hire_date=sysdate() ;
end if ;
end $$
delimiter ;
#6 lines before 'SELECT' statement.

insert into employees values('123456789','1956-09-02','Gioni','camula','M','1988-06-26'); #the values will be inserted with the given 'hire_date';
rollback;

insert into employees values('223456789','1990-09-02','el','camino','M','2021-06-26'); #the values will be inserted with the current 'hire_date'(through SYSDATE()), and not the given one;



#EXERCISE-1 with UPDATE statement
delimiter $$
create trigger update_hire_date
before update on employees                  
for each row 
begin
if new.hire_date > sysdate()
then set
new.hire_date=sysdate() ;
end if ;
end $$
delimiter ;

update employees
set hire_date='2014-06-21' where emp_no=123456789; #the values will be updated with the given hire_date;

update employees
set hire_date='2024-03-14' where emp_no=123456789; #the values will be updated with the current hire_date through SYSDATE();



#EXERCISE   --later is the question of this query
delimiter $$
create trigger new_dept_manager
after insert on dept_manager
for each row 
begin
	declare v_cur_salary int;
	select max(salary) into v_cur_salary 
    from salaries
	where emp_no=new.emp_no;

	if v_cur_salary is not null then
	update salaries # here , UPDATE code is not working because this TRIGER is for INSERT and not UPDATE. got you
	set from_date= sysdate()
	where emp_no= new.emp_no and to_date= new.to_date;

	insert into salaries values(new.emp_no, v_cur_salary + 20000, new.from_date, new.to_date); #since 'emp_no' in 'salaries' is a PRIMARY KEY, it is showing error here. Otherwise, the code would work fine. 
 end if;
end $$
delimiter ;

insert into dept_manager values('111534','d009', sysdate(), '2999-01-01');

# SELECT the record of employee number 111534 in the ‘dept_manager’ table, and then in the ‘salaries’ table to see how the output was affected. 
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no = 111534;
    
    
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = 111534
ORDER BY salary DESC;    

#Conceptually, this was an ‘after’ trigger that automatically added $20,000 to the salary of the employee who was just promoted as a manager. 
# Moreover, it set the start date of her new contract to be the day on which you executed the insert statement.

#if you wanna drop the trigger
drop trigger new_dept_manager;                  
#if you wanna delete the inserted row
delete  from dept_manager where emp_no=111534 and dept_no='d009';





