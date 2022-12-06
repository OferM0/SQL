CREATE PROCEDURE GetOrderById
	@Param1 int
AS
BEGIN
	SELECT * from Orders where OrderID=@Param1
END
GO

exec GetOrderById @Param1=10248

