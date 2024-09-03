CREATE OR REPLACE FUNCTION func_minimum(
	VARIADIC arr NUMERIC[]
)
RETURNS NUMERIC AS $$
BEGIN
	RETURN
	(SELECT MIN(arr[i]) FROM generate_subscripts(arr, 1) AS i);
END;
$$ LANGUAGE plpgsql;

-- SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);