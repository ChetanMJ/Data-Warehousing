
delete from dbo.Dim_Host;

INSERT INTO dbo.Dim_Host(Host_ID, Host_Name, Host_Location, Host_Neighbourhood, Host_url, Host_About, Host_Response_Range, Host_Acceptance_Range, Host_is_Superhost,
Host_Identity_Verified, Host_Total_Listings_Count, Active_Ind, Eff_Start_date)
select distinct CONVERT( numeric(18,0), CONVERT(varchar(max), Host_id)) as Host_ID,
CONVERT(varchar(max), host_name) as host_name,
CONVERT(varchar(max), host_location) as host_location,
CONVERT(varchar(max), host_neighbourhood) as host_neighbourhood,
CONVERT(varchar(max), host_url) as host_url,
CONVERT(varchar(max), host_about) as host_about,
case when CONVERT(varchar(max), Host_Response_Rate)='N/A' then 'N/A'
     when CONVERT(INT, CONVERT(varchar(max), Host_Response_Rate)) <=50 then 'LOW'
	 when (CONVERT(INT, CONVERT(varchar(max), Host_Response_Rate)) > 50) and (CONVERT(INT, CONVERT(varchar(max), Host_Response_Rate)) <= 80) then 'MEDIUM'
	 when (CONVERT(INT, CONVERT(varchar(max), Host_Response_Rate)) > 80) then 'HIGH'
	 END as Host_Response_Range, 
case when CONVERT(varchar(max), Host_Acceptance_Rate)='N/A' then 'N/A'
     when CONVERT(INT, CONVERT(varchar(max), Host_Acceptance_Rate)) <=50 then 'LOW'
	 when (CONVERT(INT, CONVERT(varchar(max), Host_Acceptance_Rate)) > 50) and (CONVERT(INT, CONVERT(varchar(max), Host_Acceptance_Rate)) <= 80) then 'MEDIUM'
	 when (CONVERT(INT, CONVERT(varchar(max), Host_Acceptance_Rate)) > 80) then 'HIGH'
	 END as Host_Acceptance_Range, 
CONVERT(char(1), Host_is_superhost) as Host_is_superhost,
CONVERT(char(1), Host_Identity_verified) as Host_Identity_verified,
CONVERT( int, CONVERT(varchar(max), host_total_listings_count)) as host_total_listings_count, 
'Y' as Active_Ind,
CONVERT(date, GETDATE()) as Eff_Start_date
from dbo.listings_detailed
;

-- check and remove duplicates

delete from dbo.dim_host
where host_key in
(select host_key from dbo.dim_host where host_id in
(select host_id from dbo.dim_host
  group by host_id
 having count(*) > 1
 ) and host_about is null
 )
;