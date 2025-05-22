# 1. Create a table called employees with the following structure?
#: emp_id (integer, should not be NULL and should be a primary key)Q
#: emp_name (text, should not be NULL)Q
#: age (integer, should have a check constraint to ensure the age is at least 18)Q
#: email (text, should be unique for each employee)Q
#: salary (decimal, with a default value of 30,000).

# Write the SQL query to create the above table with all constraints

create Database Employee_Data;
use Employee_Data;
CREATE TABLE employee(
    emp_id INT NOT NULL PRIMARY KEY ,    -- Integer type for employee ID
    emp_name VARCHAR(70) NOT NULL,   -- Variable character type for employee name
    age INT CHECK (age > 18),          -- Integer type with a CHECK constraint ensuring age is positive
    email VARCHAR(50) unique,    -- Variable character type for email as the primary key
    salary DECIMAL(10, 2) DEFAULT 30000.00 -- Decimal type for salary with a default value
);

-- 2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
-- examples of common types of constraints.
-- ans Constraints are like rules for our data. They help keep our data correct and organized.
--      Eg : NOT NULL, CHECK, PRIMARY KEY ,FOREIGN KEY, DEFAULT
  
  
-- 3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.
-- ANS The NOT NULL constraint ensures that a column must have a value. It guarantees that no empty or null value can be entered into the specified column.
--  This is important for maintaining data integrity
-- No, a primary key cannot contain NULL values.

-- The primary key is a unique identifier for each row in a table. It ensures that each record can be uniquely identified.
-- Allowing NULL values in a primary key would mean having records that do not have a unique identifier, which goes against the primary purpose of the primary key.


-- 4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
-- example for both adding and removing a constraint.
-- Answer
## Adding Constraint
ALTER TABLE employee
ADD CONSTRAINT chk_salary CHECK (salary >= 30000);

ALTER TABLE employee
DROP CONSTRAINT chk_salary;


-- 5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
-- Provide an example of an error message that might occur when violating a constraint.
INSERT INTO employee (emp_id, emp_name, age, email, salary)
VALUES (12342, 'Sonali', 21, 'sonali.fiits@gmail.com', 23000);
# here chk_salary constraint is violated


-- Q 6. You created a products table without constraints as follows:

CREATE TABLE products (

    product_id INT,

    product_name VARCHAR(50),

    price DECIMAL(10, 2));
-- Now, you realise that?
-- : The product_id should be a primary keyQ
-- : The price should have a default value of 50.00
ALTER TABLE products
ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id);

ALTER TABLE products
ALTER COLUMN price SET DEFAULT 50.00;


-- 7  using table given below.Write a query to fetch the student_name and class_name for each student using an INNER JOIN.

CREATE TABLE students (
    student_id INT,
    student_name VARCHAR(100),
    class_id INT
);


INSERT INTO employee (student_id, student_name, class_id)
VALUES 
    (1, 'ALICE', 101),
    (2, 'BOB', 102),
    (3, 'Charlie', 101);
    
    
create table classes(
class_id int,
class_name varchar(45)
);

INSERT INTO classes (class_id, class_name)
VALUES 
    (101, 'Math'),
    (102, 'Science'),
    (103, 'History');
    
-- Write a query to fetch the student_name and class_name for each student using an INNER JOIN.  
select student_name,class_name from employee e
inner join classes c on 
e.class_id=c.class_id;

-- 8 Question
create table orders(
order_id int,
order_date datetime,
customer_id int);

INSERT INTO orders (order_id, order_date, customer_id)
VALUES 
    (1, '2024-01-01', 101),
    (2, '2024-01-03', 102);


create table customers(
customer_id int,
customer_name varchar(50)
);
insert into customers(customer_id,customer_name)
values(101, 'Alice'),
      (102 ,'Bob');
      
drop table products;
create table products(
product_id int,
product_name varchar(50),
order_id int);
insert into products(product_id,product_name,order_id)
values(1,'Laptop',1),
	(2,'phone',Null);

-- Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
-- listed even if they are not associated with an order 
-- Hint: (use INNER JOIN and LEFT JOIN)
SELECT p.product_name, o.order_id, c.customer_name 
FROM products p
LEFT JOIN orders o ON p.order_id = o.order_id
LEFT JOIN customers c ON o.customer_id = c.customer_id;


-- 9 Question
create table sales(
sales_id int,
product_id int,
amount decimal);
insert into sales (sales_id,product_id,amount)
values(1,101,500),
	(2,102,300),
    (3,101,700);

drop table products;
create table products(
product_id int,
product_name varchar(50));
insert into products(product_id,product_name)
values(101,'laptop'),
      (102,'phone');

-- Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
select product_name ,sum(amount)
from products p
inner join sales s
on s.product_id=p.product_id
group by product_name ;

--  Question 10

select * from orders;
select * from customers;
create table order_details(
order_id int,
product_id int,
quantity int);
insert into order_details(order_id,product_id,quantity)
values(1,101,2),
	 (1,102,1),
     (2,101,3);
     
-- Write a query to display the order_id, customer_name, and the quantity of products ordered by each
-- customer using an INNER JOIN between all three tables.


SELECT o.order_id, c.customer_name, od.quantity
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_details od ON od.order_id = o.order_id
ORDER BY c.customer_name;





-- SQL COMMAND (USING MAVENMOVIES)
 USE MAVENMOVIES;
 
-- 1 Identify the primary keys and foreign keys in maven movies db. Discuss the differences
-- ACTOR TABLE - actor_id(PK)
-- ACTOR AWARD TABLE-- actor award id (PK)
-- ADDRESS TABLE - adress_id
-- ADVISOR TABLE- advisor_id(PK)
-- Category TABLE - category_id(PK)
-- City TABLE - city_id (PK)
-- Country TABLE- country_id(PK)
-- Customer TABLE- customer_id(PK)
-- FILM TABLE - film_id(PK)
-- FILM ACTOR TABLE - actor_id(PK), film_id(Foreign key)
-- Film Category Table- category_id(PK), film_id(Foreign key)
-- Film text Table - film_text (foreign key)
-- inventory Table - inventory_id (PK),inventory_film(Foreign key) ,inventory_store(Foreign key)
-- INVESTOR TABLE = investor_id (PK)
-- LANGUAGE ID = language_id
-- Payment table - Payment id (PK), Foreign key(customer_id.staff_id, rental_id)
-- rental table = rental_id(PK), Foreign key(rental_date,inventory_id,customer_id,staff_id)
-- staff table - satff_id(PK) , store_id(Foreign key)
-- store table - store_id 

-- 2 Q   List all details of actors
-- By using this code we can find out details of all actors
select * from actor;

-- 3 List all customer information from DB.
-- By using this code we can find out information of all  customer
select * from customer;

-- 4 List different countries
select country from country;

-- 5 Display all active customers
select first_name from customer where active =1;

-- 6 List of all rental IDs for customer with ID 1.
SELECT rent.rental_id 
FROM rental rent
INNER JOIN customer cus
ON cus.customer_id = rent.customer_id 
WHERE cus.customer_id = 1;

-- 7  Display all the films whose rental duration is greater than 5 .
select title from film where rental_duration > 5;

-- 8 List the total number of films whose replacement cost is greater than $15 and less than $20.
select title from film where replacement_cost > 15 and replacement_cost< 20;

-- 9 Display the count of unique first names of actors.
SELECT COUNT(DISTINCT first_name) 
FROM actor;

-- 10- Display the first 10 records from the customer table .
select * from customer limit 10;

-- 11 - Display the first 3 records from the customer table whose first name starts with ‘b’.
SELECT * 
FROM customer 
WHERE first_name LIKE 'B%' 
LIMIT 3;

-- 12 -Display the names of the first 5 movies which are rated as ‘G’.
select title from film where rating like 'G%' limit 5;


-- 13-Find all customers whose first name starts with "a".
select * from customer where first_name like 'a%';

--  14- Find all customers whose first name ends with "a".
select * from customer where first_name like '%a';

-- 15- Display the list of first 4 cities which start and end with ‘a’ .
select city from city where city like 'a%a' limit 4;

-- 16 Find all customers whose first name have "NI" in any position.
SELECT first_name
FROM customer
WHERE first_name LIKE '%NI%';

-- 17- Find all customers whose first name have "r" in the second position .
SELECT first_name
FROM customer
WHERE first_name LIKE '_r%';

-- 18 - Find all customers whose first name starts with "a" and are at least 5 characters in length.
SELECT first_name
FROM customer
WHERE first_name LIKE 'a____%';

--  19- Find all customers whose first name starts with "a" and ends with "o".
SELECT first_name
FROM customer
WHERE first_name LIKE 'a%o';

-- 20 - Get the films with pg and pg-13 rating using IN operator.
SELECT title ,rating
FROM film 
WHERE rating IN ('PG', 'PG-13');

--  21 - Get the films with length between 50 to 100 using between operator.
SELECT title , length
FROM film 
WHERE length BETWEEN 50 AND 100;

-- 22 - Get the top 50 actors using limit operator.
SELECT first_name 
FROM actor 
ORDER BY actor_id 
LIMIT 50;


-- 23 - Get the distinct film ids from inventory table
select distinct film_id from inventory ;


##### Functions

-- Question 1: Retrieve the total number of rentals made in the Sakila database.
select count(rental_id) from rental;

-- Question 2: Find the average rental duration (in days) of movies rented from the Sakila database.
SELECT AVG(rental_duration) AS average_rental_duration 
FROM film;

-- Question 3: Display the first name and last name of customers in uppercase.
SELECT UPPER(FIRST_NAME) AS FIRST_NAME ,UPPER(LAST_NAME) AS LAST_NAME FROM CUSTOMER;

-- 4 Extract the month from the rental date and display it alongside the rental ID.
SELECT RENTAL_ID ,MONTH(RENTAL_DATE) FROM RENTAL;

##### GROUP BY:
-- Question 5: Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
SELECT CUSTOMER_ID , COUNT(RENTAL_ID) as rental_count FROM RENTAL GROUP BY CUSTOMER_ID;

--  Question 6: Find the total revenue generated by each store
SELECT s.store_id, SUM(p.amount) AS total_revenue
FROM payment p
INNER JOIN rental r ON p.rental_id = r.rental_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN store s ON i.store_id = s.store_id
GROUP BY s.store_id;


-- Question 7: Determine the total number of rentals for each category of movies.
select cat.name , count(r.rental_id) AS total_rentals from category cat
inner join film_category f_c on f_c.category_id = cat.category_id
inner join category c on c.category_id = f_c.category_id
inner join film f on f.film_id = f_c.film_id
inner join inventory i on i.film_id=f.film_id
inner join rental r on r.inventory_id=i.inventory_id group by cat.name
ORDER BY total_rentals DESC;



-- Question 8: Find the average rental rate of movies in each language
SELECT l.name AS language_name, AVG(f.rental_rate) AS average_rental_rate
FROM language l
left JOIN film f ON f.language_id = l.language_id
GROUP BY language_name;



### Joins
-- Questions 9 -Display the title of the movie, customer s first name, and last name who rented it.

 SELECT 
    f.title, 
    c.first_name, 
    c.last_name
FROM 
    film f
INNER JOIN 
    inventory i 
ON 
    f.film_id = i.film_id
INNER JOIN 
    rental r 
ON 
    r.inventory_id = i.inventory_id
INNER JOIN 
    customer c 
ON 
    r.customer_id = c.customer_id;



-- Question 10: Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
select first_name from actor a
inner join film_actor fa on fa.actor_id =a.actor_id
inner join film f on f.film_id=fa.film_id 
where title in ('Gone with the Wind') ;

-- Question 11: Retrieve the customer names along with the total amount they've spent on rentals.
-- Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_amount_spent
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
INNER join rental r on r.customer_id=c.customer_id
GROUP BY c.first_name, c.last_name;


-- Question 12: List the titles of movies rented by each customer in a particular city (e.g., 'London').
SELECT cu.first_name, cu.last_name, f.title,ci.city
FROM customer cu
INNER JOIN address a ON cu.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN rental r ON cu.customer_id = r.customer_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
GROUP BY cu.first_name, cu.last_name, f.title;


### Advanced Joins and GROUP BY:
-- Question 13: Display the top 5 rented movies along with the number of times they've been rented.
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;

-- Question 14: Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
-- Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY

SELECT 
    c.first_name, 
    c.last_name
FROM 
    customer c
WHERE 
    c.customer_id IN (
        SELECT 
            r1.customer_id
        FROM 
            rental r1
        INNER JOIN 
            inventory i1 
        ON 
            r1.inventory_id = i1.inventory_id
        WHERE 
            i1.store_id = 1
    )
AND 
    c.customer_id IN (
        SELECT 
            r2.customer_id
        FROM 
            rental r2
        INNER JOIN 
            inventory i2 
        ON 
            r2.inventory_id = i2.inventory_id
        WHERE 
            i2.store_id = 2
    );



use mavenmovies;


-- Windows Function:
-- 1. Rank the customers based on the total amount they've spent on rentals.

SELECT 
    RANK() OVER (ORDER BY SUM(p.amount) DESC) AS rank_number,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_amount
FROM 
    customer c
INNER JOIN 
    payment p ON p.customer_id = c.customer_id
GROUP BY 
    c.first_name, c.last_name;

    
    
-- 2. Calculate the cumulative revenue generated by each film over time
SELECT 
    f.title,
    p.payment_date,
    p.amount,
    SUM(p.amount) OVER (PARTITION BY f.film_id ORDER BY p.payment_date) AS cumulative_revenue
FROM 
    film f
INNER JOIN 
    inventory i ON f.film_id = i.film_id
INNER JOIN 
    rental r ON i.inventory_id = r.inventory_id
INNER JOIN 
    payment p ON r.rental_id = p.rental_id
ORDER BY 
    f.title, p.payment_date;


-- 3. Determine the average rental duration for each film, considering films with similar lengths.
SELECT 
    title,
    AVG(rental_duration) AS average_rental_duration,
    RANK() OVER (PARTITION BY length ORDER BY AVG(rental_duration) DESC) AS rank_number
FROM 
    film
GROUP BY 
    title, length;


-- 4. Identify the top 3 films in each category based on their rental counts.
WITH FilmRanks AS (
  SELECT
    f.title,
    c.name AS category,
    COUNT(r.rental_id) AS rental_count,
    ROW_NUMBER() OVER (PARTITION BY c.name ORDER BY COUNT(r.rental_id) DESC)  
    as rank_no
  FROM
    film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
  GROUP BY
    f.title, c.name
)
SELECT
  title,
  category,
  rental_count
FROM
  FilmRanks
WHERE
  rank_no <= 3
ORDER BY
  category, rental_count DESC;




-- 5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
SELECT
  c.customer_id,
  COUNT(r.rental_id) AS rental_count,
  AVG(COUNT(r.rental_id)) OVER () AS avg_rental_count,
  COUNT(r.rental_id) - AVG(COUNT(r.rental_id)) OVER () AS difference
FROM
  customer c
  JOIN rental r ON c.customer_id = r.customer_id
GROUP BY
  c.customer_id
ORDER BY
  c.customer_id;



-- 6. Find the monthly revenue trend for the entire rental store over time
SELECT 
  s.store_id,
  DATE_FORMAT(p.payment_date, '%Y-%m') AS month,
  SUM(p.amount) AS monthly_revenue,
  SUM(SUM(p.amount)) OVER (ORDER BY DATE_FORMAT(p.payment_date, '%Y-%m')) AS running_total_revenue
FROM 
  payment p
  JOIN staff st ON p.staff_id = st.staff_id
  JOIN store s ON st.store_id = s.store_id
GROUP BY 
  s.store_id,
  DATE_FORMAT(p.payment_date, '%Y-%m')
ORDER BY 
  DATE_FORMAT(p.payment_date, '%Y-%m');





-- 7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.
WITH CustomerSpending AS (
  SELECT 
    c.customer_id,
    SUM(p.amount) AS total_spending
  FROM 
    customer c
    JOIN rental r ON c.customer_id = r.customer_id
    JOIN payment p ON r.rental_id = p.rental_id
  GROUP BY 
    c.customer_id
),
Top20PercentCustomers AS (
  SELECT 
    customer_id,
    total_spending,
    NTILE(5) OVER (ORDER BY total_spending DESC) AS spending_percentile
  FROM 
    CustomerSpending
)
SELECT 
  customer_id,
  total_spending
FROM 
  Top20PercentCustomers
WHERE 
  spending_percentile = 1
ORDER BY 
  total_spending DESC;

 -- 8. Calculate the running total of rentals per category, ordered by rental count.
 SELECT
    name,
    rental_count,
    SUM(rental_count) OVER (ORDER BY rental_count DESC) AS running_total
FROM (
    SELECT 
        c.name,
        COUNT(r.rental_id) AS rental_count
    FROM 
        rental r
    JOIN 
        inventory i ON r.inventory_id = i.inventory_id
    JOIN 
        film f ON i.film_id = f.film_id
    JOIN 
        film_category fc ON f.film_id = fc.film_id
    JOIN 
        category c ON fc.category_id = c.category_id
    GROUP BY 
        c.name
) AS CategoryRentals
ORDER BY 
    rental_count DESC;

 -- 9. Find the films that have been rented less than the average rental count for their respective categories.
 WITH CategoryAverages AS (
    SELECT 
        fc.category_id,
        AVG(COUNT(r.rental_id)) OVER (PARTITION BY fc.category_id) AS avg_rental_count
    FROM 
        film f
    JOIN 
        inventory i ON f.film_id = i.film_id
    JOIN 
        rental r ON i.inventory_id = r.inventory_id
    JOIN 
        film_category fc ON f.film_id = fc.film_id
    GROUP BY 
        fc.category_id
)
SELECT 
    f.title,
    COUNT(r.rental_id) AS rental_count
FROM 
    film f
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
JOIN 
    film_category fc ON f.film_id = fc.film_id
JOIN 
    CategoryAverages ca ON fc.category_id = ca.category_id
GROUP BY 
    f.title, fc.category_id, ca.avg_rental_count
HAVING 
    COUNT(r.rental_id) < ca.avg_rental_count
ORDER BY 
    f.title;

 -- 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.

SELECT 
    EXTRACT(MONTH FROM payment_date) AS month,
    SUM(amount) AS total_revenue,
    RANK() OVER (ORDER BY SUM(amount) DESC) AS rank_number
FROM 
    payment
GROUP BY 
    EXTRACT(MONTH FROM payment_date)
ORDER BY 
    rank_number
LIMIT 5;


 
 

 
 
 # Normalisation & CTE
-- 1. First Normal Form (1NF):
-- a. Identify a table in the Sakila database that violates 1NF. Explain how you
-- would normalize it to achieve 1NF.

-- ANSWER The awards column potentially violates 1NF as it contains multiple awards in a single column for each actor, such as Emmy, Oscar, Tony  in one row.
-- Normalization to Achieve 1NF
-- To normalize the actor_award table to achieve 1NF, we need to ensure that each column contains only one value. This means splitting the awards column into separate rows.


-- 2. Second Normal Form (2NF):
-- a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. 
-- If it violates 2NF, explain the steps to normalize it.

-- ANSWER>>> Second Normal Form (2NF) means:
-- The table must first meet all the rules of First Normal Form (1NF) (columns have only atomic values).
-- No partial dependencies: All columns should depend on the entire primary key, not just part of it.
-- Normalize to 2NF:
-- Create a separate table for actors:
CREATE TABLE actors (
    actor_id SMALLINT PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45)
);
CREATE TABLE actor_award_normalized (
    actor_award_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    actor_id SMALLINT,
    award VARCHAR(45),
    last_update TIMESTAMP,
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);
INSERT INTO actors (actor_id, first_name, last_name)
VALUES (10, 'John', 'Doe'),
       (11, 'Jane', 'Smith');

INSERT INTO actor_award_normalized (actor_id, award, last_update)
VALUES (10, 'Best Actor', '2025-01-01 00:00:00'),
       (10, 'Best Director', '2025-01-01 00:00:00'),
       (11, 'Best Actress', '2025-01-01 00:00:00');




-- 3. Third Normal Form (3NF):
-- a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies 
-- present and outline the steps to normalize the table to 3NF.

-- ANSWER A table is in Third Normal Form (3NF) if:

-- It is already in Second Normal Form (2NF), which means:
-- Every non-key column depends on the entire primary key (no partial dependencies).
-- There are no transitive dependencies, which means:
-- No non-key column depends on another non-key column.

-- Problem: Transitive Dependencies
-- customer_name and customer_email depend on customer_id.
-- customer_id is a foreign key, not the primary key of the rental table.
-- So, customer_name and customer_email are indirectly depending on rental_id through customer_id. This is called a transitive dependency.
-- How to Fix the Table (Normalize to 3NF):
-- To fix this and make the table 3NF, we need to remove the transitive dependency.

-- Step 1: Move customer_name and customer_email to a new customer table.
-- We will create a separate table to store customer details, because these details depend only on customer_id, not on rental_id.




-- 4. Normalization Process:
-- a. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF.
-- Step 1: Unnormalized Form (UNF)
-- In UNF, the table has repeating data
-- Step 2: First Normal Form (1NF)
-- To get to 1NF, we:

-- Remove repeating data.
-- Make sure each column has only one value.
-- We split data into different tables:

-- Customer Table: Stores customer info.
-- Film Table: Stores film info.
-- Rental Table: Links rentals with customer, film, etc.

-- Step 3: Second Normal Form (2NF)
-- To get to 2NF, we:

-- Eliminate partial dependencies (when data depends only on part of a primary key). Since rental_id is unique, no partial dependency exists.
-- The Rental Table already satisfies 2NF, because:

-- It only has one primary key (rental_id).
-- All other columns depend on rental_id.



--  5. CTE Basics:
-- a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they 
-- have acted in from the actor and film_actor tables.

WITH ActorFilmCount AS (
    SELECT 
        a.actor_id,
        a.first_name,
        a.last_name,
        COUNT(fa.film_id) AS film_count
    FROM 
        actor a
    JOIN 
        film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY 
        a.actor_id, a.first_name, a.last_name
)
SELECT 
    first_name,
    last_name,
    film_count
FROM 
    ActorFilmCount
ORDER BY 
    first_name, last_name;


-- 6. CTE with Joins:
-- a. Create a CTE that combines information from the film and language tables to display the film title, 
-- language name, and rental rate.

WITH cte AS (
    SELECT 
        f.title,
        l.name AS language_name,
        f.rental_rate
    FROM 
        film f
    JOIN 
        language l ON f.language_id = l.language_id
)
SELECT 
    title, 
    language_name, 
    rental_rate 
FROM 
    cte;

-- 7  CTE for Aggregation:
-- a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) 
--  from the customer and payment tables.
with cte as (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        p.amount
    FROM 
        customer c
    JOIN 
        payment p ON c.customer_id = p.customer_id 
)
SELECT 
    first_name, 
    last_name,
    SUM(amount) AS total_revenue 
FROM 
    cte 
GROUP BY 
    customer_id, first_name, last_name;

--  8 CTE with Window Functions:
-- a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.
WITH FilmRanks AS (
    SELECT 
        title,
        rental_duration,
        RANK() OVER (ORDER BY rental_duration DESC) AS rnk
    FROM 
        film
)
SELECT 
    title, 
    rental_duration, 
    rnk 
FROM 
    FilmRanks;


-- 9 CTE and Filtering:
-- a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the 
-- customer table to retrieve additional customer details.

WITH cus_more_than_2_rental AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        COUNT(r.rental_id) AS rental_count
    FROM 
        customer c
    JOIN 
        rental r ON c.customer_id = r.customer_id
    GROUP BY 
        c.customer_id, c.first_name, c.last_name
    HAVING 
        COUNT(r.rental_id) > 2
)
SELECT 
   *
FROM 
    customer c
JOIN 
    cus_more_than_2_rental cus
ON 
    c.customer_id = cus.customer_id;


-- 10 CTE for Date Calculations:
-- a. Write a query using a CTE to find the total number of rentals made each month, considering the 
-- rental_date from the rental table
WITH date_cal AS (
    SELECT 
        rental_id,
        DATE_FORMAT(rental_date, '%M %Y') AS formatted_date
    FROM 
        rental
)
SELECT 
    formatted_date,
    COUNT(rental_id) AS total_rentals
FROM 
    date_cal
GROUP BY 
    formatted_date;

-- 11 CTE and Self-Join:
-- a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film 
-- together, using the film_actor table.
WITH ActorPairs AS (
    SELECT 
        fa1.actor_id AS actor1_id,
        fa2.actor_id AS actor2_id,
        fa1.film_id
    FROM 
        film_actor fa1
    JOIN 
        film_actor fa2 ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id
)
SELECT 
    a1.first_name AS actor1_first_name,
    a1.last_name AS actor1_last_name,
    a2.first_name AS actor2_first_name,
    a2.last_name AS actor2_last_name,
    ap.film_id
FROM 
    ActorPairs ap
JOIN 
    actor a1 ON ap.actor1_id = a1.actor_id
JOIN 
    actor a2 ON ap.actor2_id = a2.actor_id
ORDER BY 
    actor1_first_name, actor2_first_name, ap.film_id;
    
-- 12. CTE for Recursive Search:
-- a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, 
-- considering the reports_to column

WITH RECURSIVE EmployeeHierarchy AS (
    -- Base case: Start with the specific manager (the root of the recursion)
    SELECT emp_id, emp_name, reports_to
    FROM employee
    WHERE emp_id = @manager_id  -- Replace with the manager's emp_id you're interested in

    UNION ALL

    -- Recursive case: Find employees who report to those already found in the previous step
    SELECT e.emp_id, e.emp_name, e.reports_to
    FROM employee e
    INNER JOIN EmployeeHierarchy eh
        ON e.reports_to = eh.emp_id  -- Find employees who report to the previously selected ones
)
-- Select the employees found in the recursion
SELECT emp_id, emp_name
FROM EmployeeHierarchy;


WITH RECURSIVE EmployeeHierarchy AS (
    -- Base case: Start with the specific manager
    SELECT emp_id, emp_name
    FROM employee
    WHERE emp_id = 3

    UNION ALL

    -- Recursive case: Find employees who report to those already found in the previous step
    SELECT e.emp_id, e.emp_name
    FROM employee e
    INNER JOIN EmployeeHierarchy eh
        ON e.emp_id = eh.emp_id
)
-- Select the employees found in the recursion
SELECT emp_id, emp_name
FROM EmployeeHierarchy;





 
 







