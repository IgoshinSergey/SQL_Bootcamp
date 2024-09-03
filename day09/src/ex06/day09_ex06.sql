CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
	pperson VARCHAR DEFAULT 'Dmitry', 
	pprice INT DEFAULT 500, 
	pdate DATE DEFAULT '2022-01-08'
)
RETURNS SETOF VARCHAR AS $$
BEGIN
	RETURN QUERY
	SELECT DISTINCT pizzeria.name
	FROM person_visits 
	JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
	JOIN person ON person.id = person_visits.person_id
	JOIN menu ON menu.pizzeria_id = pizzeria.id
	WHERE person.name = pperson AND menu.price < pprice AND visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

-- select *
-- from fnc_person_visits_and_eats_on_date(pprice := 800);

-- select *
-- from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
