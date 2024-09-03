SELECT 
	menu.pizza_name AS pizza_name,
	pizzeria.name AS pizzeria_name
FROM person_order
JOIN (
	SELECT id, name
	FROM person
	WHERE name = 'Denis' OR name = 'Anna') AS person
ON person.id = person_order.person_id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY pizza_name, pizzeria_name;