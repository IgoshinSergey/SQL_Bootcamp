SELECT 
	name,
	SUM(count) AS total_count
FROM (
	(SELECT 
		p.name AS name,
		COUNT(p.name) AS count,
		'order' AS action_type
	FROM person_order AS po
	JOIN menu AS m ON m.id = po.menu_id
	JOIN pizzeria AS p ON p.id = m.pizzeria_id
	GROUP BY p.name
	ORDER BY 2 DESC)
	UNION
	(SELECT 
		p.name AS name,
		COUNT(p.name) AS count,
		'visit' AS action_type
	FROM person_visits AS pv
	JOIN pizzeria AS p ON p.id = pv.pizzeria_id
	GROUP BY p.name
	ORDER BY 2 DESC)
	ORDER BY 3 ASC, 2 DESC
)
GROUP BY 1
ORDER BY 2 DESC, 1 ASC;
