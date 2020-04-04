insert into departments(dept_no,dept_name)
values(
'd010','Business Analysis');

select * from departments;

# below code is to insert values from one table to another.

CREATE TABLE departments_dup ( # creating a new table (which is supposed to be the duplicate of departments table)
    dept_no CHAR(10),
    dept_name VARCHAR(50)
);

insert into departments_dup(dept_no, dept_name) # inserting all the values of departments table into its duplicate table. table names can be different.
select * from departments;                         
