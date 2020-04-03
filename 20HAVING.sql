SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING avg(salary) > 120000
ORDER BY emp_no;

#after HAVING, you can have a condition with an aggregate function,
# while WHERE cannot use aggregate functions within its conditions

#HAVING is like WHERE but applied to the GROUP BY block.