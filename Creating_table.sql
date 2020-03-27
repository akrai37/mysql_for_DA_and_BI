use sales;
create table sales_table(
purchase_id int not null primary key,
date_of_purchase date not null,
customer_id int,
item_code varchar(10) not null
);
