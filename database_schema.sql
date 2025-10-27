drop table if exists zepto1;

-- Create table 
create table zepto1(
sku_id 					SERIAL PRIMARY KEY,
Category 				VARCHAR(120),
name 					VARCHAR(150),
mrp 					NUMERIC(8,2),
discountPercent 		NUMERIC(5,2),
availableQuantity 		INTEGER,
discountedSellingPrice 	NUMERIC(8,2),
weightInGms 			INTEGER,
outOfStock				BOOLEAN,
quantity 				INTEGER
);

-- delete table from database
 drop table zepto1;
 