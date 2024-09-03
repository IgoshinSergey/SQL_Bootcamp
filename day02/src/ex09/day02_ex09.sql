WITH female_orders AS (
	SELECT *
	FROM (
		SELECT *
		FROM person
		WHERE gender = 'female') AS person
	JOIN person_order ON person_order.person_id = person.id
)
SELECT female_orders.name AS name
FROM female_orders
JOIN (
	SELECT *
	FROM menu
	WHERE pizza_name = 'pepperoni pizza') AS menu
ON menu.id = menu_id
INTERSECT
SELECT female_orders.name AS name
FROM female_orders
JOIN (
	SELECT *
	FROM menu
	WHERE pizza_name = 'cheese pizza') AS menu
ON menu.id = menu_id;
