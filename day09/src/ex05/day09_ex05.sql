DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();

CREATE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
RETURNS SETOF person AS $$
	SELECT * FROM person WHERE gender = pgender;
$$ LANGUAGE sql;

-- select *
-- from fnc_persons(pgender := 'male');

-- select *
-- from fnc_persons();
