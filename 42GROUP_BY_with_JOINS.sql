SELECT 
    e.gender, COUNT(e.gender) AS total_employees #alternative for count(e.gender)-> count(e.emp_no). NO DIFFERENCE
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
GROUP BY e.gender;
#note:- in JOINS, one should look for key columns, which are common between the tables involved in the analysis 
#and are necessary to solve the task at hand - ip-these columns do not need to be foreign or private keys
