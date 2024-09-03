SELECT 
	p.address AS address,
	pi.name AS name,
	COUNT(pi.name) AS count_of_orders
FROM person_order AS po
JOIN person AS p ON p.id = po.person_id
JOIN menu AS m ON m.id = po.menu_id
JOIN pizzeria AS pi ON pi.id = m.pizzeria_id
GROUP BY 1, 2
ORDER BY 1, 2;