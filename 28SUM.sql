SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date >= '1997-01-01';
    
#note:- COUNT() - applicable to both numeric and non-numeric data
# other aggregate functions are only applicable to numeric data    