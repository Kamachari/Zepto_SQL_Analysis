-- data exploration 

-- count of rows
select count(*) from zepto1;

-- retrive data from zepto1
select * from zepto1;

-- only return 10 records from zepto1
select * from zepto1
limit 10;

-- check for null values
select * from zepto1
where Category is null
or
name is null
or 
mrp is null
or 
discountPercent is null
or 
availableQuantity is null
or 
discountedSellingPrice is null 
or
weightInGms is null 
or 
outOfStock is null	
or 
quantity is null
;

-- all different product category
select distinct category from zepto1
order by category
;

-- how many products in stock or out of stock
select outofstock, count(*) 
from zepto1
group by outofstock
;

-- product name present multiple times
select name, count(sku_id) as "number of sku_id"
from zepto1
group by name
having count(sku_id) > 1
order by count(sku_id) desc
;

-- data cleaning 

-- products with price = 0
select * from zepto1
where mrp = 0
or 
discountedsellingprice = 0
;

-- delete the product mrp = 0
delete from zepto1
where mrp = 0
;

-- convert price into rupees
update zepto1
set mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0
;

-- check its done or not 
select mrp, discountedsellingprice 
from zepto1
;

--  Data Analysis

-- Q1. find the top 10 best-value products based on the discount percentage.
SELECT  distinct name, mrp, discountPercent
from zepto1
order by discountpercent desc
limit 10
;

-- Q2. what are the products with high MRP but out of stcok.
select distinct name, mrp from zepto1
where outOfStock = 'TRUE' and mrp > 300
order by mrp desc
;


-- Q3. Calculate Estimated Revenue for each category.
select category, 
sum(discountedsellingprice * availablequantity) as Total_revenue
from zepto1
group by category
order by total_revenue
;

-- Q4. Find all products where MRP is greater than 500rs and discount is less tham 10%.
select distinct name, mrp, discountpercent from zepto1
where mrp > 500 or discountedsellingprice < 10
order by mrp desc, discountpercent desc
;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select category, round(avg(discountPercent),2) as avg_discount
from zepto1
group by category
order by avg_discount desc
limit 5
;


-- Q6. Find the price per gram fron products above 100g and sort by best value.
select distinct name, weightingms, discountedsellingprice,
round(discountedsellingprice/weightingms,2) as price_per_gram
from zepto1
where weightingms >=100
order by price_per_gram;


-- Q7. Group the products into categories like LOW, MEDIUM, BULK.
select distinct name, weightingms,
case when weightingms < 1000 then 'Low'
	when weightingms < 5000 then 'Medium'
	else 'Bluk'
end as weight_category
from zepto1
order by weight_category;

-- Q8. What is the Total Inventory Weight per category.
select category,
sum(weightingms * availablequantity) as tatol_weight
from zepto1
group by category
order by tatol_weight
;
