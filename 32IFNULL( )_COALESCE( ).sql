alter table departments_dup
add column dept_manager varchar(50) after dept_name;

alter table departments_dup
change column dept_name dept_name varchar(45) null;

insert into departments_dup(dept_no)
values('d010'),('d011'); #new way to insert more than 2 values at the same time in a single row. 

#ifnull statement
select dept_no, ifnull(dept_name, 'departments_name is not provided') as dept_name
from departments_dup;
#NOTE:- IFNULL(expression_1, expression_2) returns the first of the two indicated values if the data value found in
#the table is not null, and returns the second value if there is a null value
#ifnull() has precisely 2 arguments

#COALESCE
select dept_no, dept_name, coalesce(dept_manager,dept_name,'N/A') as dept_manager from departments_dup ;
#NOTE:-COALESCE() will always return a single value of the ones we have
#within parentheses, and this value will be the first non-null value of
#this list, reading the values from left to right
#another point,COALESCE() can have one, two, or more arguments

# EXERCISE-1
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup;

# EXERCISE-2
SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name,							  
            'departments_name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;

#note:-ifnull() and coalesce() do not make any changes to the data set. They merely create an output where certain data values
# appear in place of NULL values. the new column created is just for the analyzation purposes. It does not actually make any changes to the table(like creating the new column etc).