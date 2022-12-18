--enter to system

--answer 1- enter time
--answer 2- exist time
--answer 3- "id or password invalid"
--answer 4- "password date invalid, please change password"

--1.declare variables
declare @ID varchar(10) = '1234', @Password varchar(10) = '1234', @employee_code int,
@answer varchar(100)
--2.check if id exist 
select @employee_code=(select code from Employees where ID=@ID)
if @employee_code is null
--3.if not exist- return answer 3
begin
    select @answer='id or password invalid, please try again.'
end
--4.if id exist- check if password match 
else
    begin 
       if not exists(select code from Passwords where employee_code=@employee_code and password=@Password and is_active=1)
--5.if not match- return answer 3
       begin
		   select @answer='id or password invalid, please try again.'
	   end
	   else
	      begin
--6.if match- check if password date valid
             if not exists(select code from Passwords where employee_code=@employee_code and password=@Password and is_active=1 and expire_date>GETDATE())
--7.if date is not valid- return answer 4		     
			 begin
				select @answer='Your password date expired, please change it.'
		     end
			 else
--8.if date is valid- check if employee enter or exist
	            begin
                   if not exists(select * from Times where employee_code=@employee_code and exit_time is null)
--9.if enter- return answer 1 and insert to table
				   begin
			          Insert into Times values(@employee_code,GETDATE(),null)
		              select @answer='Entry time: ' + convert(varchar(20),GETDATE(),103) + ' ' + convert(varchar(20),GETDATE(),108)
		           end
			       else
--10.else- return answer 2  and insert
			       begin
			          update Times set exit_time=GETDATE() where employee_code=@employee_code and exit_time is null
		              select @answer='Exit time: ' + convert(varchar(20),GETDATE(),103) + ' ' + convert(varchar(20),GETDATE(),108)
		           end
				end	 
          end
    end
select @answer
