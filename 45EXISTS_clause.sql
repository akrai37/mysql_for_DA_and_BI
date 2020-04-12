SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            t.emp_no
        FROM
            titles t
        WHERE
            (t.emp_no = e.emp_no)
                AND (t.title = 'Assistant Engineer'))
ORDER BY e.emp_no;  #it is more professional to apply 'ORDER BY' in the outer query              