/*
We will need a list of all the staff members, including their first and last names, email addresses, 
the store identification numberwhere they work
*/
select
	first_name,
    last_name,
    email,
    store_id
from staff;

/*
We will need seperate counts of inventory items held at each of your 2 stores
*/
select
	store_id,
    count(inventory_id) as total_inventory
from inventory
group by
	store_id;

/*
We will need a count of active customers for each of the stores. Seperately, please.
*/
select
	store_id,
    count(customer_id) as active_customers
from
	customer
where active = 1
group by 
	store_id;

/*
In order to assess the liability of a data breach, we will need you to provide a count of all
customer email addresses stored in the database
*/
select
	count(email) count_of_email
from customer;

/*
We are interested in how diverse your film offering is as a mean of understanding how likely
you are to keep customers engaged in future. Please provide the count of unique film titles
you have in inventory as each store and then provide the count of the unique categories of the
film you provide
*/
select
	store_id,
    count(distinct film_id) as unique_films
from inventory
group by
	store_id;
    
select
	count(distinct name) as unique_categories
from category;

/*
We would like to understand the replacement cost of your films.
Please provide the replacement cost for the film that is least expensive to replace,
the most expensive to replace, and average of all films you carry.
*/
select
	MAX(replacement_cost) AS Highest_replacement_cost,
	MIN(replacement_cost) AS Lowest_replacement_cost,
    AVG(replacement_cost) AS Average_replacement_cost
from film;
    
/*
We are interested in having you put payment monitoring system and maximum payment
processing restrictions in place in order to minimize the future risk of fraud by your staff
Please provide the average payment you process, as well as maximum payment you have processed.
*/
select
	avg(amount) as Average_Payment,
    max(amount) as Highest_payment
from payment;

/*
We would like to better understand what your customer base looks like.
Please provide a list of all customer identification values, with the count of rentals
they have made all-time, with your highest volume customers at top of the list
*/
select
	customer_id,
    count(rental_id) as total_rentals
from rental
group by
	customer_id
order by
	count(rental_id) desc;
