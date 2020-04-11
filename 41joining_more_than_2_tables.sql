#EXERCISE-1
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON d.dept_no = m.dept_no
ORDER BY e.emp_no;
    
    
#EXERCISE-2
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    titles t ON m.emp_no = t.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no  #REMEMBER, you can use different table's columns to form JOIN connection(like in this one, we used dept_manager's dept_no with department's dept_no to have JOIN connection since their was nothing common in departments table and title table)                                                         
WHERE
    t.title = 'manager' #this condition is neccessary because it is possible that a single employee is mentioned twice or more because his job role has changed. We only want employees with manager's designation.
ORDER BY e.emp_no;
#note:-about WHERE clause,The logic behind is that we have to take into account the fact that an employee can be registered in the titles table with multiple titles, regardless of whether this is correct or not.