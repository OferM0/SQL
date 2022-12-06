select * from a where a.a in (select b.b from b where b.a between 33 and 55) 

select * from students where studentld in (select studentld from Scores group by Studentld having avg(score) > 65) 

select * from a where a.a = (selectb.b from b where b.a between 33 and 55)

select * from a where a.a not in (select b.b from b where b.a between 33 and 55) 

select * from [Order Details] where OrderID in (select OrderId from Orders where EmployeeID = 1 )

select * from a where a in (select b.b from b where b.b = a.a)

CREATE PROCEDURE myStp
AS
BEGIN
select * from a
END

create procedure OrdersOf Emp_1
as
begin
select * from Orders where EmployeeID = 1  
end

exceute myStp
exec myStp

CREATE PROCEDURE myStp
AS
BEGIN
declare @var1 int
declare @var2 nvarchar(300)
select @var1 = (select top 1 a from a)
END

CREATE PROCEDURE myStp
@Param1 int,
@PAram2 nvarchar(100)
AS
BEGIN
select * from a
where a = @Param1
END 

CREATE PROCEDURE GetOrdersOfEmp
@Param1 int
AS
BEGIN
select * from dbo.Orders
where EmployeeID = @Param1
END
GO
exec GetOrdersOfEmp @Param1=3

CREATE PROCEDURE testVar
AS
BEGIN
declare @a int
declare @b int
declare @c int
set @a=1
set @b=2
set @c = @a + @b
select @c 
END
GO
exec testVar

alter PROCEDURE GetGoodEmp
BEGIN
declare @empId int
declare @maxOrders int
select count (EmployeelID) as c,EmployeelID into EmpOrders
from dbo.Orders
group by EmployeelD
select @maxOrders = nax(c)
from EmpOrders
select @empId = EmployeelID
from EmpOrders
where c = @maxOrders
drop table EmpOrders
select @empId, @maxOrders

CREATE PROCEDURE myStp
AS
BEGIN
if (@var1=2)
begin 
//....
end
