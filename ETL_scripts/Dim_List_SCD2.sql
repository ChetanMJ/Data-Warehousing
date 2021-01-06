update dim_list 
set Active_Ind='N',Eff_End_Date='10/15/2020'
where list_key in
(
select a.List_key
from
dbo.dim_list a
join
dbo.temp_dim_list b
on a.List_ID = b.List_ID
where 
((a.List_Name <> b.List_Name)
or (a.Summary <> b.Summary)
or (a.Street <> b.Street)
or (a.Square_Feet <> b.Square_feet)) and a.Active_ind = 'Y'
);


INSERT INTO [dbo].[Dim_List]
           (
		   [List_ID]
           ,[List_Name]
           ,[Summary]
           ,[Street]
           ,[Square_Feet]
           ,[Active_Ind]
           ,[Eff_Start_Date]
           ,[Eff_End_Date])
  
  select 
		   List_ID,
		   List_Name,
		   Summary,
		   Street,
		   Square_Feet,
		   Active_Ind,
		   Eff_Start_Date, 
		   Eff_End_Date
from temp_dim_list;