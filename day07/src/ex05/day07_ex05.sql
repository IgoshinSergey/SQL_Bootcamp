SELECT 
	DISTINCT p.name AS name
FROM person_order AS po
JOIN person AS p 
ON p.id = po.person_id
ORDER BY 1;