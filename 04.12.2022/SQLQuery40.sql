CREATE PROCEDURE GetProductCntByCountry
	@Param1 nvarchar(15)
AS
BEGIN
select count(*) from Products 
inner join [Order Details] on Products.ProductID=[Order Details].ProductID 
inner join Orders on Orders.OrderID=[Order Details].OrderID 
where Orders.ShipCountry=@Param1
END
GO

exec GetProductCntByCountry @Param1='France'
