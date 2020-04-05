
select * from employees where emp_no  = 999903;
select * from titles where emp_no  = 999903;

#using the delete query
DELETE FROM employees 
WHERE
    emp_no = 999903;

#checking if the delete statement worked 
select * from employees where emp_no  = 999903;
select * from titles where emp_no  = 999903;

rollback;

# 2nd 'delete' query
DELETE FROM departments
WHERE
    dept_no = 'd010';

#checking if the delete statement worked     
SELECT 
    *
FROM
    departments
WHERE
    dept_no = 'd010';   
											   
#NOTE:- ON DELETE CASCADE
#if a specific value from the parent table’s primary key has been
#deleted, all the records from the child table referring to this value
#will be removed as well    