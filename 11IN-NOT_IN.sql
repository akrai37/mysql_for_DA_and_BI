#IN 

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');

# NOT IN 

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');


    