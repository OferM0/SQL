CREATE PROCEDURE GetOrderByCountry
	@Param1 nvarchar(15)
AS
BEGIN
select count(*) from Orders 
where Orders.ShipCountry=@Param1
END
GO

exec GetOrderByCountry @Param1='Canada'
