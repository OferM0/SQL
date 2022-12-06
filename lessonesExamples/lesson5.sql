select count(*) from dbo.Employees E
inner join dbo.Orders O on O.EmployeeID = E.EmployeeID 
inner join dbo.Customers C on C.CustomerID = O.CustomerID where E.Address like '%s%' and C.ContactName like 'M%e%'
select distinct E.FirstName, E.LastName from dbo.Employees E
inner join dbo.Orders O on O.EmployeeID=E.EmployeeID
inner join dbo.Customers C on C.CustomerID= O.CustomerID where E.Address like 's%' and C.ContactName like 'M%'

Create table aaa (taz int identity, fName nvarchar(20) not null, phone int null, city nvarchar(100) not null default 'Tel-Aviv')
create table mynewTable (col1 bigint default 10, col2 nvarchar (30)
create table Zolpo (productName nvarchar (max) not null, price int not null)

insert into Zolpo (productName, price) select ProductName, UnitPrice from dbo.Products where UnitPrice < 5

select ProductName into bbb from dbo.Products
select count(ProductName) as prodCount into nnn from dbo. Products

alter table ccc add vvv int null
alter table ccc drop column vvv

select aaa.*, bbb.* from aaa inner join bbb on aaa.num2 = bbb.num2
select aaa.num1, aaa.num2, bbb.num1, bbb.num2 from aaa inner join bbb on aaa.num1 = bbb.num2
select aaa.num1, aaa.num2, bbb.num1, bbb.num2 from bbb inner join aaa on aaa.num1 = bbb.num2
select aaa.*, bbb.* from aaa left outer join bbb on aaa.num2 = bbb.num2
select aaa.*, bbb.* from aaa right outer join bbb on aaa.num2= bbb.num2
