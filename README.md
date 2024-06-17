# SQL with Parch & Posey Database - Udacity Course README

 ## Overview
 
Welcome to the SQL with Parch & Posey Database course! This course will guide you through the fundamentals of SQL using the Parch & Posey database. You will learn to interact with a single table, understand the relationships between tables, and execute queries to retrieve and manipulate data.

## Database Schema
The Parch & Posey database consists of five tables:

## web_events

id
account_id
occurred_at
channel
accounts

## accounts
id
name
rep_id
region_id
orders

## orders
id
occurred_at
total_amt_usd
account_id
sales_reps

## sales_reps
id
name
region_id
region

## region
id
name

## Entity Relationship Diagram (ERD)
The ERD below helps visualize the relationships between the tables:

accounts is connected to web_events and orders via account_id.
accounts is connected to sales_reps via rep_id.
accounts and sales_reps are connected to region via region_id.
The "crow's foot" notation indicates how the columns in one table relate to the columns in another table.

## What to Notice

Each table can be visualized as a spreadsheet with columns.
The relationships between tables allow you to query data across multiple tables.

## Course Outline

Lesson 1: Working with a Single Table
Learn basic SQL queries to interact with individual tables.

Practice selecting, filtering, and sorting data from a single table.
Lesson 2: Understanding Table Relationships

Explore the connections between tables using JOIN operations.
Retrieve related data from multiple tables.

Lesson 3: Advanced SQL Queries
Perform complex queries involving multiple tables.
Use aggregate functions and subqueries to analyze data.

Lesson 4: Data Manipulation
Insert, update, and delete records in the database.
Ensure data integrity through constraints and transactions.

## Additional Resources

MySQL
[Udacity SQL Course Workspace](https://www.udacity.com/enrollment/ud198)

## Conclusion

This course will provide you with the skills to effectively use SQL to manage and analyze data in relational databases. By the end of this course, you will be proficient in querying and manipulating data in the Parch & Posey database. Happy learning!






