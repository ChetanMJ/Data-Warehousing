
delete from dbo.Temp_Table_YN;

insert into dbo.Temp_Table_YN(Indicator)values('Y');
insert into dbo.Temp_Table_YN(Indicator)values('N');


delete from dbo.Dim_Amenities;

Insert into dbo.Dim_Amenities (TV, Internet, Wifi, Free_Parking, Kitchen, Air_Conditioning) 
select TV, Internet, Wifi, Free_Parking, Kitchen, Air_Conditioning from
(select Indicator as TV from dbo.Temp_Table_YN) A
CROSS JOIN
(select Indicator as Internet from dbo.Temp_Table_YN) B
CROSS JOIN
(select Indicator as Wifi from dbo.Temp_Table_YN) C
CROSS JOIN
(select Indicator as Free_Parking from dbo.Temp_Table_YN) D
CROSS JOIN
(select Indicator as Kitchen from dbo.Temp_Table_YN) E
CROSS JOIN
(select Indicator as Air_Conditioning from dbo.Temp_Table_YN) F
;
