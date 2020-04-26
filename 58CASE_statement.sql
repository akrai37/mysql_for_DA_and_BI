#EXERCISE-1
SELECT 
    d.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'salary was raised more than 30000'
        WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 'salary was raised more than 20000 but less than 30000'
        ELSE 'salary was raised less than 20000'
    END AS salary_increase
FROM
    dept_manager d
        JOIN
    employees e ON d.emp_no = e.emp_no
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY emp_no;



#EXERCISE-2
#Q-obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990. 
#Create a fourth column in the query, indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee. 
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN d.dept_no IS NOT NULL THEN 'manager'
        ELSE 'employee'
    END AS field
FROM
    employees e
        LEFT JOIN  #so tht we can have both employees and manangers in our data, otherwise we will have only managers data because it is the common ele
    dept_manager d ON e.emp_no = d.emp_no
WHERE
    e.emp_no > 109990
ORDER BY e.emp_no;



#EXERCISE-3
#Q-Extract a dataset containing the following information about the managers: employee number, first name, and last name. 
#Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, and another one saying whether this salary raise was higher than $30,000 or NOT
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'salary was raised more than 30000'
        ELSE 'salary was not raised more than 30000'
    END AS salary_increase
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY e.emp_no;  #because we are using aggregate functions.



#EXERCISE-4
#Q-Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column,  saying “employed” if the employee is still working in the company, or “Not an employee” if they aren’t.
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        when to_date > sysdate() then 'employed'
        else 'not employee'
    END AS emp_status
FROM
    employees e
        JOIN
    dept_emp d ON e.emp_no = d.emp_no
order BY e.emp_no
limit 100;  
	
