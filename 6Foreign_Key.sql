use sales;
alter table sales_table
add foreign key (customer_id) references customers(customer_id) on delete cascade;

alter table sales_table
drop foreign key sales_table_ibfk_1;