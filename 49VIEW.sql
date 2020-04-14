CREATE OR REPLACE VIEW v_avg_salary_manager AS #'REPLACE' will replace the view of same name if it exists in the database.
    SELECT 
        ROUND(AVG(salary), 2) as avg_salary
    FROM
        salaries s
            JOIN
        dept_manager m
    WHERE
        s.emp_no = m.emp_no;
#note:- Don’t forget they are not real, physical data sets, meaning we cannot insert or update the information that has already been extracted.        
#also, they should be seen as temporary virtual data tables retrieving information from base tables.