create database zepto_SQL_project;
use zepto_sql_project;

create table zepto(
sku_id serial primary Key,
category varchar(120),
name varchar(150) Not Null,
mrp numeric(8,2),
discountPercent numeric(5,2),
availableQuantity integer,
discountedSellingPrice numeric(8,2),
weightInGms integer,
outofStock boolean,
quantity integer
);
 -- data exploration
 
select * from zepto;

select count(*) from zepto;


desc zepto_sql_project.zepto;

drop table zepto;

-- sample data 

select * from zepto limit 10;

-- null values 

select * from zepto_sql_project.zepto
where  name is null or
category is null or
mrp is null or
discountPercent is null or
availableQuantity is null or
discountedSellingPrice is null or
weightInGms is null or
outofStock is null or
quantity is null;


-- different product category

select distinct category from zepto_sql_project.zepto;

-- products in stock and product out of stock

select outofstock, count(sku_id)
from zepto_sql_project.zepto
group by outofStock;

-- product names present more than once

select name,count(sku_id) from zepto_sql_project.zepto
group by name 
having count(sku_id)>1
order by count(sku_id) desc;

-- data cleaning

-- products with price might be zero

select * from zepto_sql_project.zepto
where mrp=0 or discountedSellingPrice = 0;

delete from zepto where mrp = 0;

-- convert paise to rupees

SET SQL_SAFE_UPDATES = 0;

update zepto 
set mrp = mrp /100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp, discountedSellingPrice from zepto;

-- Q1. Find the top 10 best-value products based on the discount percentage.

select distinct name,mrp,discountPercent from zepto_sql_project.zepto
order by discountPercent desc
limit 10;


-- Q2 what are the product with high MRP but Out of stock

select distinct name,mrp from zepto_sql_project.zepto
where mrp >300
and outofStock = 1
order by mrp desc;

-- Q3 Calculate Estimated Revenue for each category
select category,sum(discountedSellingPrice*availableQuantity) as total_revenue
from zepto_sql_project.zepto
group by category
order by total_revenue;

-- Q4 Find all products where MRP is grater than 500 and discount is less than 10%

select distinct name,mrp,discountPercent from zepto_sql_project.zepto
where mrp >500 and 
discountPercent < 10
order by mrp desc, discountPercent desc;

-- Q5 Identify the top 5 categories offering the highest average discount percentage.

select category,round(avg(discountPercent),2) as 'top 5 categories' 
from zepto_sql_project.zepto
group by category
order by avg(discountPercent) desc
limit 5;


-- Q6 Find the price per gram for products above 100g and sort by best value.

select distinct name,weightInGms,discountedSellingPrice, round(discountedSellingPrice/weightInGms,2) as "price_per_gram"
from zepto
where weightInGms >=100
order by price_per_gram;

-- Q7 Group the products into categories like low,Medium,Bulk
select * from zepto limit 5;

select distinct name , weightingms,
case when weightingms < 1000 then "low"
when weightingms <5000 then "Medium"
else "bulk"
end as weight_category
from zepto ;



-- Q8 What is the Total Inventory weight per category
select category, sum(weightingms*availableQuantity) as 'total_weight(in grams)'
from zepto
group by category
order by 'total_weight(in grams)';
