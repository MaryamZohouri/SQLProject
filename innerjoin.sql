use BAS
select Top(100) PERCENT c.Mobile, c.Uni_Id, c.Name from tblCustomer as c inner join tblCustomerProduct 
as cp on c.Uni_Id=cp.CustomerId inner join tblProduct as p on p.ProductId=cp.Id
where (cp.EndSupportDate is not null) and (len(LTRIM(RTRIM(cp.EndSupportDate)))>5) and 
(CAST(SUBSTRING(REPLACE(cp.EndSupportDate, '-',''), 1, 8) as int)=20240101)

group by c.Mobile, c.Uni_Id, c.Name