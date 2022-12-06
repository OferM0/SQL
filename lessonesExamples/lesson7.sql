select * from dbo.Orders where EmployeeID between 2 and 3 
﻿
select
case
when EmployeeID=1 then 'Echad' 
when EmployeeID = 2 then 'Shtaim' 
when EmployeeID = 3 then 'Shalosh' 
else 'Not Set'
end
from dbo.Orders 

select SupplierID,
case
when Supplier ID between 1 and 5 then 'Class A'
when Supplier ID between 6 and 12 then 'Class B'
when Supplier ID between 13 and 15 then 'Class C'  
else 'Class Z'
end 
as SupplierGroup from dbo.Suppliers
﻿
select 
case
when EmployeeID = 1 then 'Echad'
when EmployeeID = 2 then 'Shtaim' 
when EmployeeID = 3 then 'Shalosh' 
else 'Not Set'
end as 'Oved',
case
when ShipAddress like '%a%' then 'Has A'
when ShipAddress like '%c%' then 'Has C'
else 'Not in our class'
end as 'Place',
case
when [Order Details].UnitPrice > 100 then 'Yakar'
when [Order Details].UnitPrice between 100 and 50 then 'Ragil'
else 'Zol'
end as 'Mechir' from dbo.Orders
inner join [Order Details] on [Order Details].OrderID = Orders.Orderld 

select EmployeeID,
case
when Notes like '%BA%' then 'Academic'
else 'High School'
end as Knowladge
from dbo.Employees 

select CustomerID,
case
when Region is null then 'Ein Ezor' else Region
end as Region
from dbo.Customers 

create trigger sumOfa on tblA 
for insert
as
update tbIB set b = b+(select a from inserted)

insert into tbla (col1, col2) values (456, 'abc')
create trigger trigger_OnTbl on tblA
for insert
as
begin
select col1 from inserted
end
drop trigger trigger_OnTbla 
 
create trigger trigger_cust on myCustomers 
for update
as
begin
select Customer ID, Country from inserted
insert into Relocation (CustomerID, NewPlace) 
select Customer ID, Country from inserted
end
drop trigger trigger_cust 
﻿
create trigger sumOfa on a 
after delete
as
begin
select * from deleted
end
 
create table newProductsPriceChange (Product ID int, UnitPrice money) 
create trigger trigger_newPrices on myProducts
for update
as
begin
insert into newProductsPriceChange (Product ID UnitPrice) 
select ProductID, UnitPrice from inserted
end

update myProducts
set UnitPrice =UnitPrice + 10
where ProductName like '%ch%'

select count(*) from myProducts
where ProductName like 'ch'  

exec sp_spaceused Products