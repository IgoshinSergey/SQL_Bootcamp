INSERT INTO person_order(id, person_id, menu_id, order_date)
SELECT
	generate_series(MAX(person_order.id) + 1, MAX(person_order.id) + MAX(person.id)) AS id,
	generate_series(1, MAX(person.id)) AS person_id,
	(SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
	'2022-02-25'::date AS order_date
FROM person
JOIN person_order ON person.id = person_order.person_id;