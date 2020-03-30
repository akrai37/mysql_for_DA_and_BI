create table companies(
company_id varchar(255),
company_name varchar(255),
headquarters_phone_number varchar(255) null
);

alter table companies
add unique key (headquarters_phone_number);     

alter table companies
change column headquarters_phone_number headquarters_phone_number varchar(255) not null;