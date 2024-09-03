WITH all_orders AS (
	SELECT
		pizzeria.name AS pizzeria_name,
		person.gender AS gender
	FROM person_order
	JOIN menu ON person_order.menu_id = menu.id
	JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
	FULL JOIN (
		SELECT id, gender
		FROM person) AS person
	ON person.id = person_order.person_id
), male_orders AS (
	SELECT pizzeria_name
	FROM all_orders
	WHERE gender = 'male'
), female_orders AS (
	SELECT pizzeria_name
	FROM all_orders
	WHERE gender = 'female'
)
(SELECT * FROM male_orders
EXCEPT
SELECT * FROM female_orders)
UNION
(SELECT * FROM female_orders
EXCEPT
SELECT * FROM male_orders)
ORDER BY 1;