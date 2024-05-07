/*
1.Write a SQL query to count the number of characters except for the spaces for each actor. 
  Return the first 10 actors' name lengths along with their names.
 */
select * from actor;
select concat(first_name, last_name) from actor as NAME;
select length(first_name) + length(last_name) as NAME_LENGTH from actor; -- well, that's new '+'

select actor_id as COUNT, 
concat (first_name, ' ', last_name) as NAME, 
length(first_name) + length(last_name) as NAME_LENGTH from actor
limit 10;

-- Trim is used 
select actor_id as COUNT, 
trim(concat(first_name, ' ', last_name)) as NAME, 
length(first_name) + length(last_name) as NAME_LENGTH from actor
limit 10;

/*
2.List all Oscar awardees(Actors who received the Oscar award) 
  with their full names and the length of their names.
*/
select * from actor; #actor_id
select * from actor_award; #actor_id

select concat(first_name, ' ', last_name) as OSCAR_AWARDEES, 
length(first_name) + length(last_name) as NAME_LENGTH,
awards as AWARDS from actor_award
where awards like '%Oscar%';

/*
3.Find the actors who have acted in the film ‘Frost Head.’
*/
select * from actor; #actor_id
select * from film_actor; #actor_id, #film_id
select * from film; #film_id

select a.actor_id, concat(first_name, ' ', last_name) as NAME, 
title as FILM_TITLE from actor as a
inner join film_actor as fa on a.actor_id = fa.actor_id
inner join film as f on fa.film_id = f.film_id
where title = 'Frost Head';

/*
4.Pull all the films acted by the actor ‘Will Wilson.’
*/
select * from actor; #actor_id
select * from film_actor; #actor_id, #film_id
select * from film; #film_id

select concat(first_name, ' ', last_name) as ACTOR, title as FILMS from actor as a
inner join film_actor as fa on a.actor_id = fa.actor_id
inner join film as f on fa.film_id = f.film_id
where a.first_name = 'Will' and a.last_name = 'Wilson';

/*
5.Pull all the films which were rented and return them in the month of May.
*/
select * from film; #film_id
select * from inventory; #film_id, inventory_id
select * from rental; #rental_id, inventory_id, customer_id

select title as TITLE, r.rental_date as RENTAL_DATE, r.return_date as RETURN_DATE from film as f
inner join inventory as i on f.film_id = i.film_id
inner join rental as r on i.inventory_id = r.inventory_id
where r.rental_date between '2005-05-01' and '2005-05-31'
and r.return_date between '2005-05-01' and '2005-05-31';
-- OR (SIR SAID BELOW ONE IS CORRECT AS IT SELECTS FROM EACH YEAR but I showed both)
select title as TITLE, r.rental_date as RENTAL_DATE, r.return_date as RETURN_DATE from film as f
inner join inventory as i on f.film_id = i.film_id
inner join rental as r on i.inventory_id = r.inventory_id
where month(r.rental_date) = 5 and month(r.return_date) = 5;


/*
6.Pull all the films with ‘Comedy’ category.
*/
select * from film; #film_id
select * from film_category; #film_id, category_id
select * from category; #category_id

select f.title as TITLE, c.name as CATEGORY from film as f
inner join film_category as fc on f.film_id = fc.film_id
inner join category as c on fc.category_id = fc.category_id 
where c.name = 'comedy';

-- DONE


