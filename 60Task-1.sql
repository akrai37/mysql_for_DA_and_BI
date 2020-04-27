#Q-Compare the average salary of female versus male employees in the entire company until year 2002, 
#and add a filter allowing you to see that per each department.
SELECT 
    e.emp_no,
    ROUND(AVG(s.salary), 2) AS salary,
    e.gender,
    d.dept_name,
    YEAR(s.from_date) AS calendar_year
FROM
    t_employees e
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
        JOIN
    t_dept_emp de ON s.emp_no = de.emp_no
        JOIN
    t_departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_no , e.gender , calendar_year
HAVING calendar_year < 2002
ORDER BY calendar_year
;



