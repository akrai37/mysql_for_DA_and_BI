SELECT 
    salary, COUNT(salary) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary ASC;

# 'group by' gives all the unique values in the column(technically same as DISTINCT). if we use 'count()' keyword with 'group by' ,it will
#  give count of all values in the column OR no. of times that value has appeared in the column.