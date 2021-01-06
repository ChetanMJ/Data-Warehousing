delete from dbo.source_calendar_temp;

--1. indentify all continuously occupied days for a given listing and aggregate the days and pricing

insert into dbo.source_calendar_temp(list_id,occupy_date, continuous_days,total_price)
select list_id,occupy_date, continuous_days, total_price
from
(
select list_id,occupy_date,
       sum(price) over (partition by list_id, continuous_begin_date) as total_price,
       max(rolling_continuous_days) over (partition by list_id, continuous_begin_date) as continuous_days,
	   continuos_days_begin
from
(
select list_id, 
       occupy_date, price,
	   DATEDIFF(day, max(case when continuos_days_begin='1' then occupy_date end) over (partition by list_id order by occupy_date), occupy_date) + 1  as rolling_continuous_days,
	   max(case when continuos_days_begin='1' then occupy_date end) over (partition by list_id order by occupy_date) as continuous_begin_date,
	   continuos_days_begin,
	   lead(continuos_days_begin) over(partition by list_id order by occupy_date) as next_continuos_days_begin
	   from
(
	select list_id,
		occupy_date, price,
		case when DATEDIFF(day, previous_date, occupy_date) = '1' then '0'
				when previous_date is null then '1'
				when DATEDIFF(day, previous_date, occupy_date) > '1' then '1' end as continuos_days_begin
	from
		(
		select list_id, date as occupy_date, lag(date) over (partition by list_id order by date) as previous_date, price
		from
		dbo.source_calendar
		--where list_id = '102040'
		) x
) y
) z
) zz
where continuos_days_begin = 1
;

--2. from the continuously occupied days identified in step 1, break into bookings of max 7 days

delete from dbo.source_calendar_temp2;

DECLARE @cnt INT = 0;

WHILE @CNT < 54
BEGIN

   INSERT INTO dbo.source_calendar_temp2 (list_id,occupy_date, continuous_days,total_price)
   select list_id, occupy_date,  7 as continuous_days, (total_price/continuous_days)*7 as total_price from dbo.source_calendar_temp
   where continuous_days > 7
   ;

   Update dbo.source_calendar_temp
   set occupy_date = DATEADD(day, 7, occupy_date),
       total_price = total_price - ((total_price/continuous_days)*7),
	   continuous_days = continuous_days - 7
	where continuous_days > 7
   ;
   SET @cnt = @cnt + 1;
END;

insert into dbo.source_calendar_temp2
select * from dbo.source_calendar_temp where total_price is not null;