--Create employees table
Create table Employees(code int primary key identity, 
ID varchar(10), first_name varchar(20), last_name varchar(20),
cellphone varchar(10))

select * from Employees

--translate fields to hebrew
/*select id as 'מספר זהות', first_name+' '+last_name as 'שם מלא', 
cellphone as 'מספר טלפון'
from Employees*/

--Create passwords table
Create table Passwords(code int primary key identity, 
--connect to Employees table by field code
employee_code int foreign key references Employees (code),
password varchar(10), expire_date date, is_active bit)

--Create time table
Create table Times(code int primary key identity, 
--connect to Employees table by field code
employee_code int foreign key references Employees (code),
entry_time datetime, exit_time datetime)

----------------------------------------------------------
--Insert new employee with temporary password
--Declare variables
declare @ID varchar(10) = '1234', @first_name varchar(20)='Ofer',
@last_name varchar(20)= 'Mordehai', @cellphone varchar(10)= '052-222',
@temp_password varchar(10) = '1234', @employee_code int,
@answer varchar(100)
--Check if employee's id already exist
if exists(select code from Employees where ID=@ID)
begin --if exist update his details
    update Employees set first_name=@first_name, last_name=@last_name,
	cellphone=@cellphone where ID=@ID
	--Get employee code
	select @employee_code=(select code from Employees where ID=@ID)
	select @answer=@first_name+' '+@last_name+' details'+' updated successfully.'
end
else --if not exist insert new employee
begin
    Insert into Employees values(@ID,@first_name,@last_name,@cellphone)
	--Get employee code
	--@@IDENTITY =system variable that return last identity
	select @employee_code=@@IDENTITY
	select @answer=@first_name+' '+@last_name+' successfully inserted to system.'
end
--insert temporary password
--1=true, 0=false
Insert into Passwords values(@employee_code,@temp_password,GETDATE(),1)

select @answer=@answer+', Temporary password:'+@temp_password

select @answer

--------------------------------------------------
select * from Employees
select * from Passwords

--Get employees with thier passwords
select distinct first_name+' '+last_name as 'employee', Passwords.password 
as 'password'
from Employees 
inner join Passwords on Employees.code=Passwords.employee_code

-------------------------------------------------------
--change password
declare @ID varchar(10) = '1234', @old_password varchar(10) = '1234',
@new_password varchar(10) = '12345', @employee_code int,
@answer varchar(100)

--find employee code by id
select @employee_code=(select code from Employees where ID=@ID)
--check if id exist
if @employee_code is null
begin
    select @answer='id is invalid, please try again.'
end
else
  begin
--check if old password isActive
     if exists(select password from Passwords where employee_code=@employee_code and password=@old_password and is_active=1)
     begin
--check if the new password was already used
         if exists(select password from Passwords where employee_code=@employee_code and password=@new_password)
	     begin
	        select @answer='this password was already used, please write another.'
	     end
	     else
	       begin
		   --all previous passwords changed to non-active
		       update Passwords set is_active=0 where employee_code=@employee_code 
			   insert into Passwords values(@employee_code, @new_password, GETDATE()+180 ,1)
			   select @answer='password changes successfully, the eaxpire date is 180 days from today.'
		   end
     end
	 else
	   begin
	     select @answer='old password is not correct.'
	   end
  end

  select @answer