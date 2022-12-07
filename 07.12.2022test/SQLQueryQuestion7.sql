CREATE PROCEDURE GetProductsNamesAndOrderPrice3
	@orderid int 
AS
BEGIN
select ProductName,Products.UnitPrice from Products 
inner join [Order Details] on Products.ProductID=[Order Details].ProductID
where [Order Details].OrderID=@orderid

select sum(Products.UnitPrice) from Products 
inner join [Order Details] on Products.ProductID=[Order Details].ProductID
where [Order Details].OrderID=@orderid
END
GO
exec GetProductsNamesAndOrderPrice3 @orderid=10248



