--Create tables
create table Guests(code int primary key identity,name varchar(20))

create table Categories(code int primary key identity,name varchar(20))

create table Dishes(code int primary key identity,
guest_code int foreign key references Guests (code),category_code int foreign key references Categories (code),name varchar(20))

--Insert guest
declare @guest_name varchar(20)='Shahar'

if not exists(select * from Guests where name=@guest_name)
begin
    insert into Guests values(@guest_name)
end

--Show all guests
select name from Guests

--Show all guests start with A
select name from Guests where name like 'A%'