#from the 'emp_manager' table , extract the records of employees who are managers as well

SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
#it is returning 42 rows but we need only 2 rows.
# one of the ways to do that is to use DISTINCT

SELECT DISTINCT
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
#DISTINCT , in this case has its shortcomings. 
#If there is another row attached to the DISTINCT rows, it will return only the first value encountered but that may not be the required value(For ex:- returning first encountered dept_no instead of the actual one)
#the alternative could be using subquery(ies).

SELECT DISTINCT
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE
    e2.emp_no IN (SELECT 
            manager_no
        FROM
            emp_manager e2);    
#We have used a trick to return only the 2 rows required. 
#In the WHERE query ,we are returning the 'emp_no' of table_2 that are IN the 'manager_no' and there are only 2 such emp_no matching and thus, it will return only 2 rows.

#another option could be using GROUP_BY . It also has flaws since other column values cannot be defined distinctively. It will return the first value encountered and not the required one for those columns.
SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
GROUP BY manager_no;
