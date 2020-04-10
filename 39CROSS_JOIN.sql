#EXERCISE-1
SELECT 
    m.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager m
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_name;     

#EXERCISE-2       
SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    emp_no < 10011 # using WHERE instead of LIMIT.
ORDER BY e.emp_no , d.dept_no;

#EXERCISE-3
SELECT 
    m.*, d.*
FROM
    dept_manager m
        CROSS JOIN
    departments d
WHERE
    m.emp_no = 111784
ORDER BY m.dept_no , d.dept_no;  
#note:- in CROSS JOIN, all the selected values of table-1 will form connections with all the available values of table-2 (if any condition is not provided)
        #OR The CROSS JOIN is a join that connects each row of one table to each row of the other.For example if we have a table with 4 rows and another with 5, the resulting CROSS JOIN query would return 4x5=20 rows.
        
#EXERCISE-4
SELECT 
     d.*,m.*
FROM
    departments d
        CROSS JOIN
    dept_manager m
		JOIN # using JOIN along with CROSS-JOIN. The second table will have 'JOIN' relationship with the 3rd table.
        employees e on m.emp_no= e.emp_no
ORDER BY d.dept_no, m.dept_no;                  
