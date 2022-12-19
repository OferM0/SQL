declare @guest_name varchar(20)='Ofer', @category_name varchar(20)='Fish',
@dish_name varchar(20)='Salmon', @guest_code int, @category_code int

--check if guest exist
if exists(select code from Guests where name=@guest_name)
begin
    select @guest_code=(select code from Guests where name=@guest_name)
end
else 
begin
   insert into Guests values(@guest_name)
   select @guest_code=@@IDENTITY
end
--check if category exists
if exists(select code from Categories where name=@category_name)
begin
    select @category_code=(select code from Categories where name=@category_name)
    insert into Dishes values(@guest_code,@category_code,@dish_name)
end

select * from Dishes

select Guests.name as 'Guest Name', Categories.name as 'Category Name',
Dishes.name as 'Dish Name' from Guests 
inner join Dishes on Guests.code=Dishes.guest_code
inner join Categories on Categories.code= Dishes.category_code 
where Categories.name='Fish' and Guests.name='Ofer'