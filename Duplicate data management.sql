--Data Integration: How to avoid duplicate data?

--Customers and their orders
create table #table(
person_sales_order int,
sales_order varchar(10))

insert into #table
select 1,'A'
UNION ALL
SELECT 1, 'B'
UNION ALL 
SELECT 1,'C'
UNION ALL
SELECT 2,'D'  
UNION ALL
SELECT 3,'E'
UNION ALL
SELECT 3,'F'
UNION ALL
SELECT 4,NULL

select * from #table

--To see the structure of data in Big Data
select Top(20) PERCENT person_sales_order, sales_order from #table

--Concatenate all orders for each customer
SELECT person_sales_order, sales_order = STUFF((SELECT N', ' + sales_order 
  FROM #table AS p2
   WHERE p2.person_sales_order = p.person_sales_order 
   ORDER BY person_sales_order
   FOR XML PATH(N'')), 1, 2, N'')
FROM #table AS p
GROUP BY person_sales_order
ORDER BY person_sales_order;
