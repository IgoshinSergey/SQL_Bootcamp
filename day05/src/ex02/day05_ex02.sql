SET Enable_seqscan = OFF;

CREATE INDEX idx_person_name 
ON person(UPPER(name));

EXPLAIN ANALYZE 
SELECT *
FROM person 
WHERE UPPER(name) = 'DENIS';