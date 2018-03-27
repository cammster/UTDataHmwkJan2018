/*SQL Homework Week 10 Andrea Karaffa*/
/*Perform queries on the Sakila database*/
/*1a. Display first and last name of all actors from actor table*/
USE sakila;
SELECT first_name,last_name
FROM actor;
/*1b. Display first and last name together in upper case letters, name column Actor Name*/
SELECT UPPER(CONCAT_WS(' ',first_name,last_name)) Actor_Name
FROM actor;
/*2a. You need to find the ID number, first name, and last name of an actor, 
of whom you know only the first name, "Joe." */
SELECT actor_id, first_name,last_name
FROM actor
WHERE first_name="JOE";
/*2b. Find all actors whose last name contain the letters GEN:*/
SELECT actor_id, first_name,last_name
FROM actor
WHERE last_name LIKE "%GEN%";
/*2c. Find all actors whose last names contain the letters LI. 
This time, order the rows by last name and first name, in that order:*/
SELECT actor_id, first_name,last_name
FROM actor
WHERE last_name LIKE "%LI%"
ORDER BY last_name, first_name ASC;
/*2d. Using IN, display the country_id and country columns of the following countries:
 Afghanistan, Bangladesh, and China: */
 SELECT country_id,country
 FROM country
 WHERE country IN ("Afghanistan","Bangladesh","China");
 /*3a. Add a middle_name column to the table actor. Position it between first_name and last_name. Hint: you will need to specify the data type.*/
 SHOW COLUMNS FROM actor;
 ALTER TABLE actor
 ADD middle_name varchar(45) AFTER first_name;
 SHOW COLUMNS FROM actor;
 /*3b. You realize that some of these actors have tremendously long last names. Change the data type of the middle_name column to blobs.*/
 ALTER TABLE actor
 MODIFY COLUMN middle_name blob;
 SHOW COLUMNS FROM actor;
 /*3c. Now delete the middle_name column.*/
 ALTER TABLE actor
 DROP COLUMN middle_name;
 SHOW COLUMNS FROM actor;
 /*4a. List the last names of actors, as well as how many actors have that last name.*/
SELECT last_name,COUNT(*) FROM actor
GROUP BY last_name;
/*4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors*/
SELECT last_name,COUNT(*) FROM actor
GROUP BY last_name
HAVING COUNT(*)>1;
/*4c. Oh, no! The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS. 
 Write a query to fix the record.*/
SHOW COLUMNS FROM actor;
SELECT * FROM actor
WHERE last_name="Williams" AND first_name="GROUCHO";
UPDATE actor
SET first_name="HARPO" 
WHERE last_name="Williams" AND first_name="GROUCHO";
SELECT * FROM actor
WHERE actor_id=172;
/*4d. Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that GROUCHO was the correct name after all! 
In a single query, if the first name of the actor is currently HARPO, change it to GROUCHO. Otherwise, change the first name to MUCHO GROUCHO, as that is exactly what the actor will be with the grievous error. 
BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR TO MUCHO GROUCHO, HOWEVER! (Hint: update the record using a unique identifier.)*/
