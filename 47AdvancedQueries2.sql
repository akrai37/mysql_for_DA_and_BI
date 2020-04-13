drop table if exists emp_manager;
CREATE TABLE emp_manager (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
);
insert into emp_manager
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(d.dept_no) AS dept_code, #We couldn't have used DISTINCT instead of MIN() because it is not possible as it will return all the distinct department numbers and we want just one of all for each employee.
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
    ORDER BY e.emp_no) AS B
union
SELECT 
    C.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(d.dept_no) AS dept_code,#We couldn't have used DISTINCT instead of MIN() because it is not possible as it will return all the distinct department numbers and we want just one of all for each employee.
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
        e.emp_no=110039
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS C
UNION SELECT 
    D.*
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
        e.emp_no=110022
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS D;

												   








