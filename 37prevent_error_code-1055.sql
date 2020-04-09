select @@global.sql_mode;
set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', ''); # this code is used to remove restrictions on the 'GROUP BY' clause. 
#set @@global.sql_mode := concat('ONLY_FULL_GROUP_BY,', @@global.sql_mode);   it can be used to reverse what we did.



