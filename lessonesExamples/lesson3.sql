Insert Into Ovdim (shem,taz) Values( 'Nisim', 12345678)
Insert Into Ovdim (shem,taz) select name,id from workers
insert into Pensia (shem, taz) select shem, taz from Ovdim where taz > 44444

Update Ovdim set taz=123, shem = 'Nisim'
update Ovdim set shem='Niflaot' where shem = 'Nisim'

Select Upper(shem) from Ovdim 
Select Lower(shem) from Ovdim
Select '1' + Space(2) +'shem' from Ovdim
Select Reverse(shem) from Ovdim
Select Len(shem) from Ovdim
Select Shem from Ovdim where Len(Shem) > 10
Select Replace('aaxxdd', 'xx','bibi');
Select Substring(string, start position ,length);
Select Substring('aaxxdd', 2,3); → axx



