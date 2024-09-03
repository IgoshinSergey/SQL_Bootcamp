CREATE FUNCTION fnc_persons_female()
RETURNS SETOF person AS $$
	SELECT * FROM person WHERE gender = 'female';
$$ LANGUAGE sql;

CREATE FUNCTION fnc_persons_male()
RETURNS SETOF person AS $$
	SELECT * FROM person WHERE gender = 'male';
$$ LANGUAGE sql;

-- SELECT * FROM fnc_persons_female();
-- SELECT * FROM fnc_persons_male();