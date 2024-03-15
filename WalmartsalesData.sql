select *from walmartsalesdata;

-- 1. How many unique cities does the data have?

select distinct City from walmartsalesdata;

-- 2. In which city is each branch?

select distinct city , Branch from walmartsalesdata;

-- 3. How many unique product lines does the data have?

select  distinct(`Product line`) from walmartsalesdata; 

-- 4. What is the most common payment method?

select  payment , count(payment) as Total_payments from walmartsalesdata
group by payment;

-- 5. What is the most selling product line?

select `product line` , count(*) num_of_sales from walmartsalesdata
group by `product line`
order by num_of_sales desc
limit 1;   -- --problem

-- 6. What is the total revenue by month?

SELECT MONTH(Date) AS Month,SUM(Total) AS TotalRevenue
FROM walmartsalesdata
GROUP BY Month
ORDER BY TotalRevenue;

-- 7.What month had the largest COGS?

select Month(Date) as Month , max(cogs) as largest_cosg from walmartsalesdata
group by Month
order by largest_cosg desc;

-- 8. What product line had the largest revenue?

select `Product line` , max(Total) as Largest_Revenue from walmartsalesdata
group by `product line` 
order by Largest_revenue desc;

-- 9. What is the city with the largest revenue?

select city , max(total) as Largest_revenue from walmartsalesdata
group by city
order by largest_revenue desc;

-- 10. What product line had the largest VAT?

select city , max(`Tax 5%`) as Largest_vat from walmartsalesdata
group by city 
order by Largest_vat desc;

-- 11. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

-- 12. Which branch sold more products than average product sold?

select branch,`product line`, sum(Quantity) as Total_sold from walmartsalesdata
group by Branch, `product line`
having Total_sold > (select avg(Quantity) as Avg_sold from walmartsalesdata)
order by Total_sold desc;  

-- 13. What is the most common product line by gender?

select gender,`product line`, count(Quantity) as common_Sold from walmartsalesdata
group by gender,`product line`
order by common_sold desc;

-- 14. What is the average rating of each product line?

select `product line`, avg(Rating) as Avg_Rating from walmartsalesdata
group by `product line` 
order by Avg_Rating desc;

-- 15. Number of sales made in each time of the day per weekday

SELECT DAYNAME(Date) AS Weekday,COUNT(*) AS SalesCount
FROM walmartsalesdata
GROUP BY DAYNAME(Date) 
ORDER BY salescount desc; -- not understand

-- 16. Which of the customer types brings the most revenue?

select `customer type`,sum(total) as most_revenue from walmartsalesdata
group by  `customer type`
order by most_revenue desc;

-- 17. Which city has the largest tax percent/ VAT (Value Added Tax)?

select city, avg(`tax 5%`) as  Largest_tax from walmartsalesdata
group by city
order by Largest_tax desc; 

-- 18.Which customer type pays the most in VAT?

select `customer type` , sum(`tax 5%`) as most_Pays from walmartsalesdata
group by `customer type` 
order by most_pays;

-- 19. How many unique customer types does the data have?
 
 select distinct `customer type` from walmartsalesdata;

-- 20. How many unique payment methods does the data have?
 
 select distinct payment from walmartsalesdata;
 
 -- 21. What is the most common customer type?
 
 select `customer type`, count(`customer type`) as common_type from walmartsalesdata
 group by `customer type`
 order by common_type;
 
 -- 22.Which customer type buys the most?
 
 select `customer type`, sum(Quantity) as most_buy from walmartsalesdata
 group by `customer type`
 order by most_buy;
 
 -- 23. What is the gender of most of the customers?
 
  select gender, count(`customer type`) as most_customer from walmartsalesdata
 group by gender
 order by most_customer desc;

-- 24. What is the gender distribution per branch?

select gender, branch, count(branch) as per_branch from walmartsalesdata 
group by gender, branch
order by branch,per_branch desc;

-- 25. Which time of the day do customers give most ratings?
 
 select `customer type`,HOUR(time) as hourday, avg(rating) as most_rating from walmartsalesdata
 group by `customer type`, hourday 
 order by  most_rating desc;
 
 -- 26. Which time of the day do customers give most ratings per branch?
 
  select branch,HOUR(time) as hourday, avg(rating) as most_rating from walmartsalesdata
 group by  hourday , branch
 order by  most_rating desc; 
 
 -- 27.Which day fo the week has the best avg ratings?
  
  select dayname(date) as weekdays, avg(rating) as most_rating from walmartsalesdata
  group by weekdays
  order by most_rating desc;
  
  -- 28. Which day fo the week has the best avg ratings per branch?
  
  select Branch,dayname(date) as weekdays, avg(rating) as most_rating from walmartsalesdata
  group by weekdays,branch
  order by most_rating desc; -- -- not working