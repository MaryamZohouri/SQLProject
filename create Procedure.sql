use BAS
select * from Table_1

create procedure spl
@dep nchar(50),
@mname nchar(50)
as 
insert into Table_1(clgname, manager)
values(@dep, @mname)

Go
Execute spl 'Informatik', 'Herr Schneider'
