SET Enable_seqscan = OFF;

CREATE UNIQUE INDEX idx_menu_unique 
ON menu(pizzeria_id, pizza_name);

EXPLAIN ANALYZE
SELECT * 
FROM menu 
WHERE pizzeria_id = 2 AND pizza_name = 'cheese pizza';