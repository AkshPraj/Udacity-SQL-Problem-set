
use parsch_porsley;
select * from accounts;
select * from orders;
select * from region; 
select * from web_events;
select * from sales_reps;

-- 1.	Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.

select name, primary_poc, sales_rep_id
from accounts
where name in ("walmart","Target", "NordStrom");

-- 2.	Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.

select * from web_events
where channel in ("organic","adwords");

-- 3.All the companies whose names do not start with 'C'. using accounts table

select name from accounts
where name not like "C%";

-- 4 All companies whose names do not contain the string 'one' somewhere in the name

select name from accounts
where name not like "%one%";

-- 5.All companies whose names do not end with 's'.

select name from accounts
where name not like "%S";

-- 6 Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.

select * from orders
where standard_qty > 1000 and poster_qty = 0 and gloss_qty = 0;

-- 7 Using the accounts table, find all the companies whose names do not start with 'C' and end with 's'.

select name from accounts
where name not like "C%" and name like "%S";

-- 8 When you use the BETWEEN operator in SQL, do the results include the values of your endpoints, or not? Figure out the answer to this important question by writing a query that displays the order date and gloss_qty data for all orders where gloss_qty is between 24 and 29. Then look at your output to see if the BETWEEN operator included the begin and end values or not.

select * from orders
where gloss_qty between 24 and 29;

-- 9 .Use the web_events table to find all information regarding individuals who were contacted via the organic or adwords channels, and started their account at any point in 2016, sorted from newest to oldest.

select * from web_events
where channel in ("organic", "adwords") and
occurred_at between '2016-01-01' and '2017-01-01'
order by occurred_at desc;


-- 10 Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table.

select id from orders
where gloss_qty > 4000 or poster_qty > 4000;

-- 11 Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.

select * from orders
where standard_qty = 0  and 
(gloss_qty > 1000 or poster_qty > 1000);

-- 12 Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.

select name from accounts
where (name like "C%" or name like "W%")
and ((primary_poc like "%ana%" or primary_poc like "%Ana%")
and primary_poc not like "%eana%");