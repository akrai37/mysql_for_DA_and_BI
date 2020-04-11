SELECT 
    e.gender ,AVG(s.salary) AS average_salary #in genenral, there will be a 'GROUP BY' clause if there is an Aggregate fn in the query.
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY e.gender
ORDER BY s.salary;

