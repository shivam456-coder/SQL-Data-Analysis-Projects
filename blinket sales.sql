create table blinket_sales(
Item_Fat_Content varchar(100),
Item_Identifier	varchar(50),
Item_Type	varchar(50),
Outlet_Establishment_Year int,
Outlet_Identifier	varchar(50),
Outlet_Location_Type	varchar(50),
Outlet_Size	varchar(50),
Outlet_Type	varchar(50),
Item_Visibility	float,
Item_Weight	float,
Sales	float,
Rating	float
);

select * from blinket_sales;
insert  into (Item_Fat_Content,Item_Identifier,Item_Type,Outlet_Establishment_Year,
Outlet_Identifier,Outlet_Location_Type,
Outlet_Size,Outlet_Type,Item_Visibility,Item_Weight,Sales,Rating)

update blinket_sales
set Item_Fat_Content='Low Fat'
where Item_Fat_Content in ('lf','LF','low fat')

update blinket_sales
set Item_Fat_Content='Regular'
where Item_Fat_Content=('reg')

update blinket_sales
set item_weight = (avg(item_weight))
where item_weight is null

select * from blinket_sales

UPDATE blinket_sales
SET item_weight = (SELECT AVG(item_weight) FROM blinket_sales WHERE item_weight IS NOT NULL)
WHERE item_weight IS NULL;

-- Overall Business KPIs---
select
	sum(sales) as tota_sales,
	count(item_identifier) as total_item_sold,
	avg(sales) as avg_sales,
	avg(rating) as avg_rating
from blinket_sales;

select * from blinket_sales;

--Sales by item Type--
select item_type,
sum(sales) as total_sales,
count(*) as item_count,
Round(Avg(rating)::numeric,2) as avg_rating
from blinket_sales
group by item_type
order by total_sales desc;

--Outlet location & size analysis
select outlet_location_type, outlet_size,
sum(sales) as total_sales,
count(distinct outlet_identifier) as total_outlets
from blinket_sales
group by outlet_location_type, outlet_size
order by total_sales desc;

--Fat content impact on sales--
select item_fat_content,
sum(sales) as total_sales,
avg(sales) as avg_sales
from blinket_sales
group by item_fat_content





