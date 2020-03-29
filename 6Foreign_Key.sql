use sales;
alter table sales_table
add foreign key (customer_id) references customers(customer_id) on delete cascade;   #'on delete' is used for referencial deletion meaning if 
#something has been deleted from the parent table, connected values (with foreign key) wil be deleted from the child table.

alter table sales_table
drop foreign key sales_table_ibfk_1;
