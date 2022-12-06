CREATE PROCEDURE GetOrderByProductId
	@Param1 int 
AS
BEGIN
select * from Orders 
inner join [Order Details] on Orders.OrderID=[Order Details].OrderID 
where [Order Details].ProductID=@Param1
END
GO

exec GetOrderByProductId @Param1=11
