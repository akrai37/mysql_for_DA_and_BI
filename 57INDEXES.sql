##############################################################################################################
#INDEXES
#the index of a table functions like the index of a book
#data is taken from a column of the table and is stored in a certain order in a distinct place, called an index
##############################################################################################################

#EXERCISE-1
SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
        
create index i_hire_date on employees(hire_date); # normal 'INDEX' syntax      


#EXERCISE-2
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'georgi'
        AND last_name = 'facello';
        
create index i_composite on employees (first_name,last_name);  #syntax for composite INDEX (it is applied to multiple columns; it only searcher for one of the fields at a time, but it does search for all the fields eventually)      


#EXERCISE-3
alter table employees
drop  index i_hire_date;

#EXERCISE-4
#Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.

SELECT 
    *
FROM
    salaries
WHERE
    salary > 89000;

create index i_salaries on salaries(salary);





