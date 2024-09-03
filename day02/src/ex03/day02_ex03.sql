WITH days_interval AS (
	SELECT GENERATE_SERIES('2022-01-01'::date, '2022-01-10'::date, INTERVAL '1 day') AS date
)
SELECT DISTINCT days_interval.date::date AS missing_date
FROM days_interval
LEFT JOIN (
	SELECT visit_date 
	FROM person_visits
	WHERE person_visits.person_id = 1 OR person_visits.person_id = 2) AS visits
ON days_interval.date = visits.visit_date
WHERE visit_date IS NULL
ORDER BY missing_date;