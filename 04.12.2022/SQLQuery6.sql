select FirstName+' '+LastName as 'name', case when Notes like '%BA%' then 'academic' else 'high-school' end as 'education' from Employees

select City, case when Region is null then 'no region' else Region end as Region from Employees

select *,case 
when Country like 'A%' then 'AAA' 
when Country like 'B%' then 'BBB' 
when Country like 'C%' then 'CCC' 
else 'ZZZ'
end as 'COUNTRY_NICK'
from Customers 

select *,case 
when UnitPrice < 5 then 'cheap' 
when UnitPrice between 5 and 10 then 'Medium' 
when UnitPrice between 100 and 150 then 'expensive' 
else 'norma'
end as 'price_recomendation'
from Products 

select CustomerId from Orders where OrderID in(select OrderID from [Order Details] where UnitPrice=14)

select Customers.ContactName as 'customer name', Employees.FirstName+' '+Employees.LastName as 'employee name' from Customers 
INNER JOIN Orders on Customers.CustomerID=Orders.CustomerID 
INNER JOIN Employees on Orders.EmployeeID=Employees.EmployeeID 
where (Employees.City='Seattle' or Employees.City='New York' or  Employees.City='Los Angeles') and (Customers.City='Seattle' or Customers.City='New York' or  Customers.City='Los Angeles')

select * from Products where UnitPrice>30 and SupplierID in (select SupplierID from Suppliers where Country='UK' OR Country='USA')

select max(UnitPrice) from Products
select avg(UnitPrice) from Products
select min(UnitPrice) from Products
select ProductName, UnitPrice from Products where UnitPrice in(select max(UnitPrice) from Products )
select ProductName, UnitPrice from Products where UnitPrice in(select min(UnitPrice) from Products )


