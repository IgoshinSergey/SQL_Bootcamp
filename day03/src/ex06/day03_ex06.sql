SELECT 
	menu.pizza_name AS pizza_name,
	pizzeria.name AS pizzeria_name_1,
	pizzeria_2.name AS pizzeria_name_2,
	menu.price AS price
FROM menu
JOIN (SELECT id, name FROM pizzeria) AS pizzeria 
ON menu.pizzeria_id = pizzeria.id
JOIN (SELECT * FROM menu) AS menu_2 ON menu.pizza_name = menu_2.pizza_name
JOIN (SELECT id, name FROM pizzeria) AS pizzeria_2 ON pizzeria_2.id = menu_2.pizzeria_id
WHERE menu.price = menu_2.price AND menu.pizzeria_id > menu_2.pizzeria_id 
ORDER BY 1;