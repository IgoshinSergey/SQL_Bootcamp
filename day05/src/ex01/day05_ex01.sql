SET Enable_seqscan = OFF;

EXPLAIN ANALYZE 
SELECT 
	t1.pizza_name AS pizza_name,
	t2.name AS pizzeria_name
FROM menu AS t1
INNER JOIN pizzeria AS t2 
ON t1.pizzeria_id = t2.id;