--1
select * from Products where UnitPrice between 30 and 40 

--2
select * from Products where CategoryID=2
 
--3
--first war
select * from Products 
inner join Categories on Products.CategoryID=Categories.CategoryID  
where Categories.Description like '%s%' order by Products.ProductName

--second war
select * from Products 
where CategoryID in (select CategoryID from Categories where Description like '%s%') order by ProductName

--4
--first way
select distinct ProductName from Products 
inner join [Order Details] on Products.ProductID=[Order Details].ProductID
inner join Orders on [Order Details].OrderID=Orders.OrderID
inner join Customers on Orders.CustomerID=Customers.CustomerID
where Customers.CustomerID='ALFKI'

--second way
select distinct ProductName from Products 
inner join [Order Details] on Products.ProductID=[Order Details].ProductID
inner join Orders on [Order Details].OrderID=Orders.OrderID
where Orders.CustomerID='ALFKI'

--5
select * from Orders where ShipCity='London' or ShipCountry='Brazil'

--6
--first way
select distinct ContactName from Customers
inner join Orders on Customers.CustomerID=Orders.CustomerID
inner join Shippers on Orders.ShipVia=Shippers.ShipperID
where Shippers.CompanyName='Federal Shipping'

--second way
select distinct ContactName from Customers
inner join Orders on Customers.CustomerID=Orders.CustomerID
where ShipVia=3

--7
--exec GetProductsNamesAndOrderPrice3 @orderid=10248

--8
select CustomerID,EmployeeID,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPostalCode,ShipCountry
from Orders
where CustomerID like 'B%' and (EmployeeID=2 or EmployeeID=5) and ShipVia=1 and ShipName like 'B%'

--9
select [Order Details].OrderId, ProductID, UnitPrice, Quantity,Discount, OrderDate,EmployeeID,CustomerID
from [Order Details] inner join Orders on Orders.OrderID=[Order Details].OrderID or Orders.OrderID!=[Order Details].OrderID
where [Order Details].OrderId=10248 and Orders.CustomerID = 'VINET' and Discount=0
order by [Order Details].UnitPrice,Orders.EmployeeID

--10
select distinct CustomerID,ShipRegion as 'Region' ,ShipCountry as 'Country'
from Orders
where (ShipCountry='France' or ShipCountry='Canada')