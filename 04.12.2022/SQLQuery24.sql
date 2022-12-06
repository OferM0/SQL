CREATE PROCEDURE GetProductNameByPrice
	@Param1 money 
AS
BEGIN
select ProductName from Products where UnitPrice=@Param1
END
GO

exec GetProductNameByPrice @Param1=14.00
