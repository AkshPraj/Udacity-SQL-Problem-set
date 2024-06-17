select * from accounts;
select * from orders;
select * from region; 
select * from web_events;
select * from sales_reps;


--  Subquery
-- 45 -	use the test environment below to find the number of events that occur for each day 
-- for each channel. now create a subquery that simply provides all of the data from your 
-- first query. Now find the average number of events for each channel. Since you broke out by -- day earlier, this is giving you an average per day.


select channel, avg(events) as average_events
from (select day(occurred_at) as day,
	channel, count(*) as events
	from web_events
	group by 1, 2
	order by 3 desc) sub
group by channel
order by 2 desc;

-- 46 
-- Use DATE_TRUNC to pull month level information about the first order ever placed in the 
-- orders table
-- Use the result of the previous query to find only the orders that took place in the same 
-- month and year as the first order, and then pull the average for each type of paperqty in -- this month.


-- 1.Here is the necessary quiz to pull the first month/year combo from the orders table.
select monthname(occurred_at) from orders;

-- Then to pull the average for each, we could do this all in one query, but for readability, I provided two queries below to perform each separately.

select avg(standard_qty) avg_std, avg(gloss_qty) avg_gloss, 
avg(poster_qty) as avg_pst
from orders
where monthname(occurred_at) = 
			(select monthname(min(occurred_at)) from
            orders);
            
select sum(total_amt_usd)
from orders
where monthname(occurred_at) = 
			(select monthname(min(occurred_at)) from
            orders);
            