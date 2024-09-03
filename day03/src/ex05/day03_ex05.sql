SELECT pizzeria.name AS pizzeria_name
FROM person_order
JOIN (
	SELECT id, name
	FROM person
	WHERE name = 'Andrey') AS person
ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
RIGHT JOIN (
	SELECT *
	FROM person_visits
	JOIN (
		SELECT id, name
		FROM person
		WHERE name = 'Andrey'
	) AS person
	ON person_visits.person_id = person.id
) AS person_visits
ON person_visits.pizzeria_id = menu.pizzeria_id
LEFT JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE person_order.id is NULL
ORDER BY 1;