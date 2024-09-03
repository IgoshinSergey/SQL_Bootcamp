SELECT 
	pizza_name,
	price,
	name AS pizzeria_name
FROM menu
LEFT JOIN person_order ON person_order.menu_id = menu.id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE person_order.id IS NULL
ORDER BY 1, 2;