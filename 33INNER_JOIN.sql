SELECT 
    m.emp_no, m.dept_no, e.first_name, e.last_name, e.hire_date
FROM
    dept_manager m
        INNER JOIN # we can also simply write it as just 'JOIN'.
    employees e ON m.emp_no = e.emp_no
GROUP BY m.emp_no #'GROUP BY' is neccesssary to avoid duplicate values for the result to contain only unique values.
ORDER BY dept_no; #'ORDER BY' in joins, in general , does not require to be associated with a table. (like m.dept_no is wrong)