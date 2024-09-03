SET Enable_seqscan = OFF;

CREATE UNIQUE INDEX idx_person_discounts_unique 
ON person_discounts (person_id, pizzeria_id);

EXPLAIN ANALYZE
SELECT 
	pe.name AS name,
	pi.name AS pizzeria_name
FROM person_discounts AS pd
JOIN person AS pe ON pe.id = pd.person_id
JOIN pizzeria AS pi ON pi.id = pd.pizzeria_id
