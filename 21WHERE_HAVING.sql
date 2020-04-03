SELECT 
    emp_no, COUNT(emp_no) AS total_contracts
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING total_contracts > 1
ORDER BY emp_no;

# 'having' cannot have both aggregate and non aggregate functions at once. it is a rule.