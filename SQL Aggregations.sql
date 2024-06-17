select * from accounts;
select * from orders;
select * from region; 
select * from web_events;
select * from sales_reps;



-- 25 Find the total amount of poster_qty paper ordered in the orders table

select sum(poster_qty) as total_poster
from orders;

-- 26 Find the total amount of standard_qty paper ordered in the orders table.

select sum(standard_qty) as total_standard
from orders;

-- 27 Find the total dollar amount of sales using the total_amt_usd in the orders table.

select sum(total_amt_usd) as total_dollar
from  orders;

-- 28.Find the total amount for each individual order that was spent on standard and gloss paper in the orders table. This should give a dollar amount for each order in the table.

select standard_amt_usd + gloss_amt_usd as total_standard_gloss
from orders;

-- 29 Though the price/standard_qty paper varies from one order to the next. I would like this ratio across all of the sales made in the orders table.

select sum(standard_amt_usd)/sum(standard_qty) as standard_price_per_unit
from orders;

-- 30 When was the earliest order ever placed?

select min(occurred_at) 
from orders;

-- 31 Try performing the same query as in question 1 without using an aggregation function.

select occurred_at
from orders
order by occurred_at 
limit 1;

-- 32 When did the most recent (latest) web_event occur?

select max(occurred_at)
from web_events;

-- 33 Try to perform the result of the previous query without using an aggregation function.

select occurred_at
from web_events
order by occurred_at desc
limit 1;

-- 33 Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper type purchased per order. Your final answer should have 6 values - one for each paper type for the average number of sales, as well as the average amount.

select avg(standard_qty) as mean_standard, avg(gloss_qty) as mean_gloss, 
avg(poster_qty) as mean_poster, avg(standard_amt_usd) as mean_standard_usd, 
avg(gloss_amt_usd) as mean_gloss_usd, avg(poster_amt_usd) as mean_poster_usd
from orders;

-- 34. Via the video, you might be interested in how to calculate the MEDIAN. Though this is more advanced than what we have covered so far try finding - what is the MEDIAN total_usd spent on all orders? Note, this is more advanced than the topics we have covered thus far to build a general solution, but we can hard code a solution in the following way.

select * 
from (select total_amt_usd
		 from orders
         order by total_amt_usd
         limit 3457) as tab1
order by total_amt_usd desc
limit 2;

-- 35 Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order.

select a.name, o.occurred_at
from orders o join accounts a
on a.id = o.account_id
order by o.occurred_at 
limit 1;

-- 36 Find the total sales in usd for each account. You should include two columns - the total sales for each company's orders in usd and the company name.

select a.name, sum(o.total_amt_usd) as total_sales
from orders o join accounts a
on a.id = o.account_id
group by a.name;

-- 37 Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? Your query should return only three values - the date, channel, and account name.

select w.channel, a.name, w.occurred_at
from accounts a join web_events w
on a.id = w.account_id
order by w.occurred_at desc
limit 1;

-- 38 Find the total number of times each type of channel from the web_events was used. Your final table should have two columns - the channel and the number of times the channel was used.

select channel, count(*)
from web_events
group by channel;

-- 39 who was the primary contact associated with the earliest web_events?

select a.primary_poc
from web_events w
join accounts a
on a.id = w.account_id
order by w.occurred_at
limit 1;

-- 40. What was the smallest order placed by each account in terms of total usd. Provide only two columns - the account name and the total usd. Order from smallest dollar amounts to largest.

select a.name, o.total_amt_usd
from accounts a join orders o
on a.id = o.account_id
order by o.total_amt_usd;

-- 41 Find the number of sales reps in each region. Your final table should have two columns - the region and the number of sales_reps. Order from fewest reps to most reps.

select r.name, count(*) as num_reps
from region r
join sales_reps s
on r.id = s.region_id
group by r.name
order by num_reps;

-- 42 Determine the number of times a particular channel was used in the web_events table for each sales rep. Your final table should have three columns - the name of the sales rep, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.

select s.name, w.channel, count(*) num_events
from accounts a join web_events w
on a.id = w.account_id
join sales_reps s
on s.id = a.sales_rep_id
group by s.name, w.channel
order by num_events desc;

-- 43 Determine the number of times a particular channel was used in the web_events table for each region. Your final table should have three columns - the region name, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.

select r.name, w.channel, count(*) as num_events
from accounts a join web_events w
on a.id = w.account_id
join sales_reps s
on s.id = a.sales_rep_id
join region r
on r.id =  s.region_id
group by r.name, w.channel
order by num_events desc;

-- 44.Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order. Limit the results to the first 10 orders, and include the id and account_id fields. 

select id, account_id , standard_amt_usd/standard_qty as unit_price
from orders
limit 10;

--  This is for a division by zero. You will learn how to get a solution without an error to 
-- this query when you learn about CASE statements in a later section.
-- Now, let's use a CASE statement. This way any time the standard_qty is zero, we will return -- 0, and otherwise we will return the unit_price.

select account_id,
	case when standard_qty = 0 or standard_qty is null then 0
    else standard_amt_usd/standard_qty end as unit_price
from orders
limit 10;
