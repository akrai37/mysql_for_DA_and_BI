create table companies(
company_id varchar(255),
company_name varchar(255),
headquarters_phone_number varchar(255)
);

alter table companies
add unique key (headquarters_phone_number);

alter table companies 
change column company_name company_name varchar(255) default 'X'; #adding default value 'X' for the column 'company_name'

insert into companies(company_id ,headquarters_phone_number )
values ('1324A','30438403482');
