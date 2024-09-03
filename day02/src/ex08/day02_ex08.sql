SELECT DISTINCT person.name AS name
FROM (
	SELECT *
	FROM person
	WHERE (address = 'Moscow' OR address = 'Samara') AND gender = 'male') AS person
JOIN person_order ON person_order.person_id = person.id
JOIN (
	SELECT *
	FROM menu
	WHERE pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza') AS menu
ON menu.id = person_order.menu_id
ORDER BY name DESC;