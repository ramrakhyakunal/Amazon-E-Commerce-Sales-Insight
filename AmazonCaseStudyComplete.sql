SELECT * FROM amazonecommerce.amazon;
SET SESSION sql_mode = '';


##1.	List all products with a discounted price below ₹500.
select distinct product_name, discounted_price from amazon
where discounted_price > 500
order by discounted_price;

##2.	Find products with a discount percentage of 50% or more.
select distinct product_name, 
concat(round((discount_percentage*100),2),'%') as discountPercentage 
from amazon
where discount_percentage > '0.5'
order by discount_percentage;

##3.	Retrieve all products where the name contains the word "Cable."
select distinct product_name from amazon
where product_name like '%Cable%';

##4.	Display the difference between the average of the actual price and the average of discounted price for each product.
select distinct avg(actual_price), avg(discounted_price), product_name, avg(actual_price) - avg(discounted_price) as avg_Diff
from amazon
group by product_name;
##or
select distinct product_name, avg(actual_price - discounted_price) as avg_Diff
from amazon
group by product_name;

##5.	Query reviews that mention "fast charging" in their content.
select distinct product_name, review_content from amazon
where review_content like '%fast charging%';

##6.	Identify products with a discount percentage between 20% and 40%.
select distinct product_name, 
concat(round((discount_percentage*100),2),'%') as discountPercentage 
from amazon
where discount_percentage between '0.2' and '0.4';

##7.	Find products that have an actual price above ₹1,000 and are rated 4 stars or above.
select distinct product_name, actual_price, rating from amazon
where rating > 4 and actual_price > 1000;

##8.	Find products where the discounted price ends with a 9 ?
select distinct product_name, discounted_price from amazon
where right(discounted_price,1) = 9;
##or
select distinct product_name, discounted_price from amazon
where discounted_price like '%9';

##9.	Display review contents that contains words like worst, waste, poor, or not good.
select distinct review_content
from amazon 
where review_content like '%worst%' or review_content like '%waste%' 
or review_content like '%poor%' or review_content like '%not good%'
order by length(review_content) desc; -- Longest complaints first

##10.	List all products where the category includes "Accessories."
select distinct product_name
from amazon
where category like '%Accessories%'
order by product_name;
