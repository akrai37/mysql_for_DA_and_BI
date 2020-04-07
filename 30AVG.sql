#AVG - null value wont be counted while calculating average. 
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01'; 
    
    
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no;     
    
    