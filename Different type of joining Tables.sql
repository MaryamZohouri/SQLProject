create database mydb

use mydb
create table qtable
(Id int,
Firstname varchar(30),
Lastname varchar(30),
Salary varchar(30),
Position varchar(50)
)

use mydb
select * from qtable

insert into qtable(Id,Firstname,Lastname,Salary,Position)
values(1,'Maryam','zohoori',4500,'DataAnalyst'),
(2,'Juli','schulz',3000,'ProduktManager'),
(3,'Peter','schafer',5000,'DataManager'),
(4,'sarah','Hefler',2800,'sekreterin'),
(5,'Sebastian','Knor',6000,'DataAnalyst'),
(6,'Marco','Nikolei',5000,'Berater'),
(7,'Janousch','schafer',3000,'Werbung');
select * from qtable 

--show me all the lastnames
select Lastname from qtable

--show me all the groupname
select Position from qtable

--show me all the distinct groupname
select distinct Position from qtable

--Filtering; show me all the ids that are DataAnalyst
select Id,Position from qtable where Position like 'DataAnalyst'

--give me a list of employee who have salary>4500
select*from qtable where salary>4000

--Two Conditions: give me a list of employees who have salry=4500 or 5000
select*from qtable where salary in (4500,5000)

--give me a list of employees who have the word Data
--select*from ptable where Position like '%Data'

--give me employees who have salary between 4000 and 6000
select*from qtable where Salary between 4000 and 6000

--add value to a column
select Lastname,Salary,Salary+500 as adjusted_salary from qtable

--Into
--create a new table
select Lastname,Salary,Salary+500 as adjusted_salary into qtable2 from qtable
select*from qtable2

--create temporary table
select Lastname,Salary,Salary+500 as adjusted_salary into #temptable from qtable
select*from #temptable

--delete data (rows) from table
delete qtable2 where Lastname like 'Nikolei'
select*from qtable2

--Update
update qtable2
set Lastname='Mast Zohoori' where Lastname like 'Zohoori'
select*from qtable2

-----JOIN TABLES-----
--Inner join
create table myemployee(ID int, firstname varchar(20), lastname varchar(20))
insert into myemployee values(1, 'Manoel', 'schulz')
insert into myemployee values(2, 'Sarah', 'schafer')
insert into myemployee values(3, 'Julia', 'Knarr')

create table msalary(ID int, salary float)
insert into msalary values(1, 10000)
insert into msalary values(2, 8000)
insert into msalary values(3, 6000)

select*from myemployee
select*from msalary
select A.firstname, A.lastname, B.salary  from employee A inner join msalary B on A.ID=B.ID

--Outer join
--left outer join
create table cell(ID int, phonenumber varchar(20))
insert into cell values(1, '9112347788')
insert into cell values(2, '9110341708')

select*from myemployee
select*from cell
select A.firstname, A.lastname, B.phonenumber from myemployee A left join cell B on A.ID=B.ID

--right outer join
create table myparking(ID int, parksplatz varchar(20))
insert into myparking values(1, 'A1')
insert into myparking values(2, 'A2')
select*from myparking
select A.parksplatz, B.lastname from myparking A right join myemployee B on A.ID=B.ID

--full outerjoin
create table tcustomer(ID int, name varchar(30))
insert into tcustomer values(1,'Sarah')
insert into tcustomer values(3,'Manoel')

create table myorder(ono int, oname varchar(30), ID int)
insert into myorder values(1,'order1',1)
insert into myorder values(2,'order2',2)
insert into myorder values(3,'order3',6)
insert into myorder values(4,'order4',7)

select*from tcustomer
select*from myorder
--select name.A, ono.B, oname.B from tcustomer A full outer join myorder B on A.ID=B.ID

--cross join; not equall dimension
select*from tcustomer cross join msalary
select*from tcustomer,msalary

