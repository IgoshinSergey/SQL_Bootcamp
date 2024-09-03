CREATE VIEW v_price_with_discount AS
SELECT
	person.name,
	menu.pizza_name,
	menu.price,
	(price - 0.1 * price)::int AS discount_price
FROM person_order
JOIN (SELECT id, name FROM person) AS person 
ON person_order.person_id = person.id
JOIN (SELECT id, pizza_name, price FROM menu) AS menu
ON person_order.menu_id = menu.id
ORDER BY 1, 2;