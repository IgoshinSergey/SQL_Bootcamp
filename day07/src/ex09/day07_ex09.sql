SELECT 
	address,
	ROUND(MAX(age) - MIN(age)::numeric / MAX(age), 2) AS formula,
	ROUND(AVG(age), 2) AS average,
	ROUND(MAX(age) - MIN(age)::numeric / MAX(age), 2) > ROUND(AVG(age), 2) AS comparison
FROM person
GROUP BY 1
ORDER BY 1;