SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(d.dept_no) AS dept_code,#We couldn't have used DISTINCT instead of MIN() because it will return all the distinct department numbers and here, we want just one department of all for each employee.
            (SELECT 
                    e.emp_no
                FROM
                    employees e
                WHERE
                    emp_no = 110022) AS manager_id
    FROM
        employees e
    JOIN dept_emp d ON e.emp_no = d.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(d.dept_no) AS dept_code,
            (SELECT 
                    e.emp_no
                FROM
                    employees e
                WHERE
                    emp_no = 110039) AS manager_id
    FROM
        employees e
    JOIN dept_emp d ON e.emp_no = d.emp_no
    WHERE
        e.emp_no BETWEEN 10021 AND 10040
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS B;
#note:- Without 'GROUP BY' it is returning only 1 row . Why? Well, the reason we obtain such result is because we are using an aggregate function here - MIN(), which requires grouping.   
