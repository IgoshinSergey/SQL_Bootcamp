SELECT DISTINCT days::date AS missing_date
FROM GENERATE_SERIES('2022-01-01'::date, '2022-01-10'::date, INTERVAL '1 day') AS days
LEFT JOIN (
	SELECT visit_date 
	FROM person_visits
	WHERE person_visits.person_id = 1 OR person_visits.person_id = 2)
ON days = visit_date
WHERE visit_date IS NULL
ORDER BY 1;