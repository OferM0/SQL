--Examples from youtube video num 4
--use of '_' and '%'
select * from anashim where shem like 'A%'
select * from anashim where shem like '%e%'
select * from anashim where shem like '_i'
select * from anashim where shem like '_i%'
select * from anashim where shem like '_b_%e_%h%'
select * from anashim where shem not like '_e'

--Targilim from youtube video num 4
--1
select * from Employees where FirstName like 'N%' 
--2
select * from Employees where (FirstName like '%A%' OR FirstName like '%B%') and FirstName like '%C%' 
--3
select * from Employees where (lower(FirstName) like '%A%' OR lower(FirstName) like '%B%') and FirstName like '%C%' 

--Examples from youtube video num 4
--use of NULL
select * from anashim where yeladim is null 

select * from anashim where yeladim is not null 

--Targilim from youtube video num 4
--inner joins
--1
select * from [Order Details] inner join Orders on [Order Details].OrderID = Orders.OrderID
--2
select * from [Employees] inner join EmployeeTerritories on [Employees].EmployeeID = EmployeeTerritories.EmployeeID
inner join Territories on Territories.TerritoryID = EmployeeTerritories.TerritoryID
--3
select * from [Orders] inner join Shippers on [Orders].ShipVia = Shippers.ShipperID where CompanyName = 'United Package'

--Targilim from Teams on video num 4
--1
select Products.CategoryID, ProductId,CategoryName from Products INNER JOIN Categories ON Products.CategoryID=Categories.CategoryID
--2
select CategoryName from Products INNER JOIN Categories ON Products.CategoryID=Categories.CategoryID  where ProductId>100
--3
select ProductName, CompanyName from Products INNER JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
--4
select ProductName, CompanyName from Products INNER JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID where Country='USA'
--5
select ProductName, CompanyName from Products INNER JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID where Country<>'Germany'
--6
select CompanyName from Suppliers where HomePage is not null
--7
select ProductName from Products INNER JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID where HomePage is not null
--8
select OrderDate from Orders where OrderID=10408
--9
select ProductName from Products INNER JOIN [Order Details] ON Products.ProductID=[Order Details].ProductID where OrderID=10408
--10
select CompanyName from Products INNER JOIN [Order Details] ON Products.ProductID=[Order Details].ProductID INNER JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID where OrderID=10408
