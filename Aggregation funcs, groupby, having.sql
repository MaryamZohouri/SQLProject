--Aggregation functions: Count, sum, Avg, Max, Min
use BAS

select Max(Score) from Registration
select Count(Score) from Registration 

--group by & having
select * from Registration

--it leads to error, as we have two fields.
select studentCode, Avg(Score) from Registration
--error handeling: group by

select * from Registration
select studentCode, avg(Score) from Registration
Group by studentCode
--having for puting conditions on aggregation functions
having avg(Score)>15

--Alias name
--order by the AVG desc


