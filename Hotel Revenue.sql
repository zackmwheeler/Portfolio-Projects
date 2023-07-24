-- Combining Years 2018,2019 and 2020 into one table

with hotels as(
select *
from dbo.[2018]
union
select *
from dbo.[2019]
union
select *
from dbo.[2020]
)

-- Find Revenue From Year to Year and by Hotel Type


--select 
--	arrival_date_year, 
--	hotel, 
--	ROUND(SUM((stays_in_week_nights+stays_in_weekend_nights)*adr),2) as revenue
--from hotels
--group by 
--	arrival_date_year, 
--	hotel

-- Add remaining tables

Select *
From hotels
LEFT JOIN dbo.market_segment
on hotels.market_segment = market_segment.market_segment
LEFT JOIN dbo.meal_cost
on hotels.meal = meal_cost.meal

-- Create Viz in Tableau for Stakeholders
-- https://public.tableau.com/views/HotelRevenue_16902273762170/Dashboard2?:language=en-US&:display_count=n&:origin=viz_share_link
