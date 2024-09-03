SELECT 
	name,
	count(menu_id),
	round(SUM(price) / COUNT(name), 2) AS average_price,
	max(price) AS max_price,
	min(price) AS min_price
FROM pizzeria AS pi
JOIN menu AS m ON m.pizzeria_id = pi.id
JOIN person_order AS po ON po.menu_id = m.id
GROUP BY name
ORDER BY 1;