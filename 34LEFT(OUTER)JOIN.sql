#EXERCISE-1
SELECT 
    e.emp_no, e.first_name, e.last_name, d.from_date, d.dept_no
FROM
    employees e
        LEFT JOIN
    dept_manager d ON e.emp_no = d.emp_no
WHERE # ,where' is used just to show that we can apply conditions with joins. 
    e.last_name = 'markovitch'# in this case, it will return records with 'last name' values which are not in other table, thus can be used as a filtering method
ORDER BY d.dept_no DESC;     

# EXERCISE-2        
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager m
        LEFT OUTER JOIN  #'LEFT JOIN' can be written as 'LEFT OUTER JOIN'    
    departments d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;