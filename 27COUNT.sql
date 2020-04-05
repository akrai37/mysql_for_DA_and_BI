
select count(dept_no) from dept_emp; # '*' counts all the values including null values, else null value wont be counted.

select count(distinct dept_no) from dept_emp; # distinct allows only unique values. No two same values. 
#OR helps us find the number of times unique values are encountered in a given column 

#NOTE:- aggregate functions- they gather data from many rows of a table, then aggregate it into a single value.COUNT(), MIN(), MAX(), AVG(), SUM()
