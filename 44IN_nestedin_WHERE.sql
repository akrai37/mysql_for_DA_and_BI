#SUBQUERIES
#employees number that can be found in the 'dept_manager' table
SELECT 
    e.emp_no, e.first_name, e.last_name, e.gender
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            m.emp_no
        FROM
            dept_manager m
        WHERE
            from_date > '1990-01-01');
#note:- the SQL engine would execute the innermost query first, and then each subsequent query, until it runs the outermost query last           