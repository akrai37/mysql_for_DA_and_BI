SELECT 
    *
FROM
    titles
LIMIT 10;

insert into employees # in this case,you dont have to mention the column names because we are inserting values for each column present in the table.cont.
values(  #values need to be inserted in order. 
 999903,
'1977-09-14',
'Johnathan',
'Creek',
'M',
'1997-01-01'
);

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

# NOTE:- we cannot insert any row or anything in the child table if the value is not present in the parent table.It will show 'foreign key constraint fail'.
#thats why we first updated the employees table(parent table) and now we will update the titles table(child table).

insert into titles(emp_no, title, from_date)
values(999903,'senior engineer','1997-10-01');


select * from titles order by emp_no desc;


insert into dept_emp
values(
999903,
'd005',
'1997-10-01',
'9999-01-01');

select * from dept_emp order by emp_no desc;