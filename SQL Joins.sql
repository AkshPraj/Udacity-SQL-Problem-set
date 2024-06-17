

use parsch_porsley;
select * from accounts;
select * from orders;
select * from region; 
select * from web_events;
select * from sales_reps;


-- 13 Try pulling all the data from the accounts table, and all the data from the orders table.

select * from orders o
join accounts a
on o.account_id = a.id;

-- 14 Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc from the accounts table.

select standard_qty, gloss_qty, poster_qty, website, primary_poc
from orders o
join accounts a
on o.account_id = a.id;

-- 15 Provide a table for all web_events associated with account name of Walmart. There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.

select a.name, a.primary_poc, w.occurred_at, w.channel
from accounts a join web_events w
on a.id = w.account_id
where a.name = "walmart";

-- 16 Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.

select r.name, s.name, a.name from
sales_reps s join region r
on s.region_id = r.id
join accounts a
on a.sales_rep_id = s.id
order by a.name;

-- 17 Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.

select r.name as region, a.name as account, 
	   (o.total_amt_usd/o.total) as unit_price
from accounts a join orders o
on a.id = o.account_id
join sales_reps s
on a.sales_rep_id = s.id
join region r
on r.id = s.region_id;

-- 18 Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.

select r.name as region, a.name as account, s.name as rep
from accounts a join sales_reps s
on a.sales_rep_id = s.id
join region r
on r.id = s.region_id
where r.name = 'Midwest'
order by a.name;

-- 19.Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a first name starting with S and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.

select r.name as region, a.name as account, s.name as rep
from accounts a join sales_reps s
on a.sales_rep_id = s.id
join region r
on r.id = s.region_id
where s.name like "s%" and 
r.name = "Midewest"
order by a.name;


-- 20 Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a last name starting with K and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.

select r.name as region, a.name as account, s.name as rep
from accounts a join sales_reps s
on a.sales_rep_id = s.id
join region r
on r.id = s.region_id
where s.name like "% K%" and 
r.name = "Midwest";

-- 21 Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100. Your final table should have 3 columns: region name, account name, and unit price.

select r.name as region, a.name as account, 
	(o.total_amt_usd/(o.total)) as unit_price
from accounts a join orders o
on a.id = o.account_id
join sales_reps s
on s.id = a.sales_rep_id
join region r
on r.id = s.region_id
where standard_qty > 100;

-- 22.Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. Your final table should have 3 columns: region name, account name, and unit price. Sort for the smallest unit price first.

select r.name as region, a.name as account, 
	(o.total_amt_usd/(o.total)) as unit_price
from accounts a join orders o
on a.id = o.account_id
join sales_reps s
on s.id = a.sales_rep_id
join region r
on r.id = s.region_id
where standard_qty > 100 and poster_qty > 50
order by unit_price;


-- 23. What are the different channels used by account id 1001? Your final table should have only 2 columns: account name and the different channels. You can try SELECT DISTINCT to narrow down the results to only the unique values.

select distinct a.name, w.channel
from accounts a 
join web_events w
on a.id = w.account_id
where a.id = '1001';

-- 24 Find all the orders that occurred in 2015. Your final table should have 4 columns: occurred_at, account name, order total, and order total_amt_usd.

select a.name, w.occurred_at, o.total, o.total_amt_usd
from accounts a
join orders o
on a.id = o.account_Id
where o.occurred_at between '01-01-2015' and '01-01-2016'
order by o.occurred_at desc;