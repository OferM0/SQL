select * from Products
select ProductName, UnitPrice from Products
select ProductName, UnitPrice, CategoryID from Products where UnitPrice>50
select ProductName, UnitPrice, CategoryID from Products where UnitPrice<50 and UnitPrice>40
select ProductName, UnitPrice, CategoryID from Products where UnitPrice>50 and CategoryID=1 or CategoryID=2
