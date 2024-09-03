INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES
(
	(SELECT MAX(id) AS id FROM person_visits) + 1, 
	(SELECT id FROM (SELECT * FROM person WHERE name = 'Denis')), 
	(SELECT id FROM (SELECT * FROM pizzeria WHERE name = 'Dominos')), 
	'2022-02-24'
),
(
	(SELECT MAX(id) AS id FROM person_visits) + 2, 
	(SELECT id FROM (SELECT * FROM person WHERE name = 'Irina')), 
	(SELECT id FROM (SELECT * FROM pizzeria WHERE name = 'Dominos')), 
	'2022-02-24'
);