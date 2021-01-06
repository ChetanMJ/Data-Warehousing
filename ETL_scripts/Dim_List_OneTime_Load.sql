
delete from dbo.Dim_List;

Insert into dbo.Dim_List(List_ID, List_Name, Summary, Street, Square_Feet, Active_Ind, Eff_Start_date)
select distinct CONVERT( numeric(18,0), CONVERT(varchar(max), id)) as List_ID,
CONVERT(varchar(max), name) as List_Name,
CONVERT(varchar(max), summary) as Summary,
CONVERT(varchar(max), Street) as Street,
CONVERT( numeric(18,0), CONVERT(varchar(max), Square_Feet)) as Square_Feet, 
'Y' as Active_Ind,
CONVERT(date, GETDATE()) as Eff_Start_date
from dbo.listings_detailed
;