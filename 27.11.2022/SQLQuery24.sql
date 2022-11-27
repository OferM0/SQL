--Examples from youtube video num 5
--use of count(*)
select count(*) from Employees 

--use of distinct
select distinct firstName from Employees inner join Orders on Employees.EmployeeID=Orders.EmployeeID inner join Customers on Customers.CustomerID=Orders.CustomerID
where Employees.Address like '%e%' and Customers.ContactName like 'M%e%'

--use of dynamic table
----------------------------------
--create table
create table mynewTable (col1 bigint default 10 , col2 nvarchar ( 30 ) not null)

-- insert 
insert into mynewTable (col1,col2) values (1,'fff') 
insert into mynewTable (col1,col2) values (1,'bb') 
insert into mynewTable (col1,col2) values (1,'33') 
insert into mynewTable (col1,col2) values (1,'www') 
insert into mynewTable (col1,col2) values (1,'aaa') 
								  
--fetch final report 
select * from mynewTable

--drop table
drop table mynewTable
----------------------------------

--Targilim from youtube video num 5
--2
create table Zolpo (productName nvarchar ( 30 ) not null , price money not null default 10)

--3
insert into Zolpo (productName,price) select ProductName, UnitPrice from Products where UnitPrice<5
							  
--4 
select * from Zolpo

--5
drop table Zolpo
------------------------------------------

--Examples from youtube video num 5
--use of select into
select ProductName into bbb from Products
drop table bbb
select ProductName, UnitPrice into newZolpo from Products where UnitPrice<5
drop table newZolpo
select count(ProductName) as prodCount into nnn from Products
drop table nnn

--Targilim from youtube video num 5
--1,2,3
select CategoryName into exclusiveCategory from Categories inner join Products on Categories.CategoryID=Products.CategoryID where UnitPrice>40
select * from exclusiveCategory
drop table exclusiveCategory

--Examples from youtube video num 5
--use of alter table
select CategoryName into ccc from Categories
alter table ccc add vvv int null
select * from ccc

--use of drop column
alter table ccc drop column vvv
select * from ccc
drop table ccc

--use of outer join- left/right
select aaa.*, bbb.* from aaa left outer join bbb on aaa.num2=bbb.num2
select aaa.*, bbb.* from aaa right outer join bbb on aaa.num2=bbb.num2

--use of delete row(with condition)
delete from aaa where num2=8

--Targilim from Teams on video num 5
--1
select Products.ProductID,ProductName into newTable from Products inner join [Order Details] on Products.ProductID=[Order Details].ProductID inner join Orders on [Order Details].OrderID=Orders.OrderID inner join Shippers on Orders.ShipVia=Shippers.ShipperID where ShipperID=1
select top 5* from newTable
drop table newTable

--2
select Orders.ShipCity,Products.ProductName into Order2 from Products inner join [Order Details] on Products.ProductID=[Order Details].ProductID inner join Orders on [Order Details].OrderID=Orders.OrderID inner join Shippers on Orders.ShipVia=Shippers.ShipperID where ShipperID=2
select * from Order2
delete from Order2 where ShipCity like '%E%'
select distinct ProductName from Order2
drop table Order2

--3
select OrderID,Customers.CustomerID, Customers.ContactName into OrderA from Orders inner join Customers on Orders.CustomerID=Customers.CustomerID where Customers.CustomerID like '%A%'
select Suppliers.ContactName from OrderA inner join [Order Details] on OrderA.OrderID=[Order Details].OrderID inner join Products on [Order Details].ProductID=Products.ProductID inner join Suppliers on Products.SupplierID=Suppliers.SupplierID

--4
select ContactName from OrderA where ContactName like 'L%'
drop table OrderA