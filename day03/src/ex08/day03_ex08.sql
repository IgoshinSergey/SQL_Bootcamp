INSERT INTO menu(id, pizzeria_id, pizza_name, price)
VALUES (
	(SELECT MAX(id) + 1 FROM menu), 
	(SELECT id FROM (SELECT * FROM pizzeria WHERE name = 'Dominos')),
	'sicilian pizza', 
	900
);