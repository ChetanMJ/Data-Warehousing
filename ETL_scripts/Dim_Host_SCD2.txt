update Dim_Host 
set Active_Ind='N',Eff_End_Date='10/15/2020'
where Host_Key in
(
select a.Host_Key
from
dbo.Dim_Host a
join
dbo.temp_dim_host b
on a.Host_ID = b.Host_ID
where 
((a.Host_Name <> b.Host_Name)
or (a.Host_Location <> b.Host_Location)
or (a.Host_Neighbourhood <> b.Host_Neighbourhood)
or (a.Host_url <> b.Host_url)
or (a.Host_About <> b.Host_About)
or (a.Host_Response_Range <> b.Host_Response_Range)
or (a.Host_Acceptance_Range <> b.Host_Acceptance_Range)
or (a.Host_is_Superhost <> b.Host_is_Superhost)
or (a.Host_Identity_Verified <> b.Host_Identity_Verified)
or (a.Host_Total_Listings_Count <> b.Host_Total_Listings_Count)
) and a.Active_ind = 'Y'
);




####### insert into dim+_host

INSERT INTO [dbo].[Dim_Host]
           ([Host_ID]
           ,[Host_Name]
           ,[Host_Location]
           ,[Host_Neighbourhood]
           ,[Host_url]
           ,[Host_About]
           ,[Host_Response_Range]
           ,[Host_Acceptance_Range]
           ,[Host_is_Superhost]
           ,[Host_Identity_Verified]
           ,[Host_Total_Listings_Count]
           ,[Active_Ind]
           ,[Eff_Start_Date]
           ,[Eff_End_Date])
   select
		      HOST_ID
           ,Host_Name
           ,Host_Location
           ,Host_Neighbourhood
           ,Host_url
           ,Host_About
           ,Host_Response_Range
           ,Host_Acceptance_Range
           ,Host_is_Superhost
           ,Host_Identity_Verified
           ,Host_Total_Listings_Count
           ,Active_Ind
           ,Eff_Start_Date
           ,Eff_End_Date
from temp_dim_host;