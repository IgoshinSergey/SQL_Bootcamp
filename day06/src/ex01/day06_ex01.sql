INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
SELECT 
	ROW_NUMBER() OVER() AS id,
	p.person_id AS person_id,
	m.pizzeria_id AS pizzeria_id,
	CASE
		WHEN COUNT(p.person_id) = 1 THEN 10.5
		WHEN COUNT(p.person_id) = 2 THEN 22.0
		ELSE 30.0
	END AS discount
FROM person_order AS p
JOIN menu AS m ON p.menu_id = m.id
GROUP BY 2, 3
ORDER BY 2, 3