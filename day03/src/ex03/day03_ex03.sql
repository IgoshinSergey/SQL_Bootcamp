WITH all_visits AS (
	SELECT 
		pizzeria.name AS pizzeria_name,
		person.gender AS gender
	FROM person_visits
	JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
	FULL JOIN (
		SELECT id, gender
		FROM person) AS person
	ON person.id = person_visits.person_id
), male_visits AS (
	SELECT pizzeria_name
	FROM all_visits
	WHERE gender = 'male'
), female_visits AS (
	SELECT pizzeria_name
	FROM all_visits
	WHERE gender = 'female'
)
(SELECT * FROM male_visits
EXCEPT ALL
SELECT * FROM female_visits)
UNION ALL
(SELECT * FROM female_visits
EXCEPT ALL
SELECT * FROM male_visits)
ORDER BY 1;