select Products.CategoryID, ProductId,CategoryName from Products INNER JOIN Categories ON Products.CategoryID=Categories.CategoryID
select CategoryName from Products INNER JOIN Categories ON Products.CategoryID=Categories.CategoryID  where ProductId>100
select ProductName, CompanyName from Products INNER JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
select ProductName, CompanyName from Products INNER JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID where Country='USA'
select ProductName, CompanyName from Products INNER JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID where Country<>'Germany'
select ProductName from Products INNER JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID where HomePage is not null
select OrderDate from Orders where OrderID=10408
select ProductName from Products INNER JOIN [Order Details] ON Products.ProductID=[Order Details].ProductID where OrderID=10408
select CompanyName from Products INNER JOIN [Order Details] ON Products.ProductID=[Order Details].ProductID INNER JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID where OrderID=10408
