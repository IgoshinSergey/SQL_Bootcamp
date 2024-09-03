SELECT 
	(SELECT name FROM person WHERE pv.person_id = person.id) AS person_name,
    (SELECT name FROM pizzeria WHERE pv.pizzeria_id = pizzeria.id) AS pizzeria_name
FROM (SELECT person_id, pizzeria_id FROM person_visits WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09') AS pv
ORDER BY person_name ASC, pizzeria_name DESC;