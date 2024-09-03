CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name AS pizzeria_name
FROM (
	SELECT *
	FROM person_visits
	WHERE visit_date = '2022-01-08') AS person_visits
JOIN (
	SELECT id, name
	FROM person
	WHERE name = 'Dmitriy') AS person
ON person.id = person_visits.person_id
JOIN (
	SELECT *
	FROM menu
	WHERE price < 800) AS menu
ON person_visits.pizzeria_id = menu.pizzeria_id
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id;