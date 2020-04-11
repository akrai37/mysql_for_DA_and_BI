create table employees_dup(
emp_no int,
birth_date date,
first_name varchar(40),
last_name varchar(40),
gender varchar(40),
hire_date date
);

insert into employees_dup
select * from employees
limit 10;

delete from employees_dup;

insert into employees_dup
select * from employees
limit 20;

insert into employees_dup
values(10001,'1953-09-02','Georgi','Facello','M','1986-06-26');

#UNION and UNION_ALL
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = 10001 
UNION  SELECT #for union, just type UNION instead of UNION ALL
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m;
#note:- UNION is similar to JOIN but not the same. UNION adds everything in the tables whereas JOINS give only the matching values unless there is a condition(like left or right join).

#alt_def:-OIN, depending on whether INNER, LEFT, or RIGHT, allows you to obtain output that joins records from various tables in a specific way. You can think of it as horizontally combining records from various tables.
#UNION, instead, adds, or, better, unifies data from different tables. However, it is important that these tables are of the same length and contain the same column names.
#Here, the records are combined vertically, so you can think of the first table being vertically extended by the content of the other table(s) you are unifying it with.







