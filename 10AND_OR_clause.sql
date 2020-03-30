# AND clause

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';
    
select * from employees where first_name='Kellie' and gender ='F';

# OR clause

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
OR 
	first_name = 'Aruna';   