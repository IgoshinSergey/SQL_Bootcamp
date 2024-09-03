SELECT 
	pizza_name,
	price,
	pizzeria.name AS pizzeria_name,
	visit_date
FROM person_visits
JOIN (
	SELECT *
	FROM person
	WHERE name = 'Kate') AS person
ON person.id = person_visits.person_id
JOIN (
	SELECT *
	FROM menu
	WHERE price BETWEEN 800 AND 1000) AS menu
ON menu.pizzeria_id = person_visits.pizzeria_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY 1, 2, 3;