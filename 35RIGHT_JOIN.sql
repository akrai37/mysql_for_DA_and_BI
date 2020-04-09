SELECT 
    m.emp_no, m.dept_no, d.dept_name
FROM
    dept_manager m # shortcut names are known as ALIASES
        RIGHT JOIN
    departments d ON m.dept_no = d.dept_no
ORDER BY dept_no;
#note:-their functionality is identical to LEFT JOINs, with the only difference being that the direction of the operation is inverted.
#note:-LEFT and RIGHT joins are perfect examples of one-to-many relationships.think about it.