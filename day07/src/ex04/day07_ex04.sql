SELECT 
	p.name AS name,
	COUNT(p.name) AS count_of_visits
FROM person_visits AS pv
JOIN person AS p ON p.id = pv.person_id
GROUP BY p.name
HAVING COUNT(p.name) > 3;