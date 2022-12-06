CREATE PROCEDURE GetOrderByShipperId
	@Param1 int 
AS
BEGIN
select * from Orders 
inner join Shippers on Orders.ShipVia=Shippers.ShipperID 
where Shippers.ShipperId=@Param1
END

exec GetOrderByShipperId @Param1=2