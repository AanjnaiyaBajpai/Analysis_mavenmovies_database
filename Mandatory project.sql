use mavenmovies;
show tables from mavenmovies;

	
#Q1 Write a query to count the number of characters except the spaces for each other and return first 10 actors with their name length.
select first_name, last_name, length(concat(first_name,last_name)) as NameLength from actor limit 10;



#Q2 List all the oscar awardees with their full names and length of their names
select concat(first_name,' ',last_name) as Full_Name, awards, length(concat(first_name,last_name)) as Total_length 
from actor_award where awards='oscar';



#Q3 Find all the actors who have acted in the movie frost head
select TITLE,actors from film_list where title='frost head';

select a.actor_id, a.film_id, concat(b.first_name,' ',b.last_name) as Name, c.title 
from film_actor as a inner join actor as b on a.actor_id=b.actor_id
inner join film as c on a.film_id=c.film_id
where title = 'frost head';




#Q4 Pull all the films acted by the actor will wilson
select title, actors from film_list where actors like '%WILL WILSON%';


select a.actor_id, a.film_id, concat(b.first_name,' ',b.last_name) as Name, c.title 
from film_actor as a inner join actor as b on a.actor_id=b.actor_id
inner join film as c on a.film_id=c.film_id
where first_name='will' and last_name='wilson';


#Q5 Pull all the films which were rented and returned in the month of MAY

select a.inventory_id,a.film_id,b.rental_date,b.return_date,c.title
from inventory as a inner join rental as b on a.inventory_id=b.inventory_id
inner join film c on a.film_id=c.film_id
where rental_date>='2005-05-01' and return_date<='2005-05-30';



#Q6 Pull all the films with the comedy category

select FID, title, category from film_list where category='comedy';