CREATE OR REPLACE FUNCTION fnc_fibonacci(
	pstop INTEGER DEFAULT 10
)
RETURNS SETOF INTEGER AS $$
BEGIN
	RETURN QUERY
	WITH RECURSIVE Fib(Num,Prev) AS (
	   	SELECT 0, 1
	  	UNION ALL
		SELECT Fib.Num + Fib.Prev, Fib.Num FROM Fib
		WHERE Fib.Num + Fib.Prev < pstop
	)
	SELECT Num FROM Fib;
END;
$$ LANGUAGE plpgsql;

-- select * from fnc_fibonacci(100);
-- select * from fnc_fibonacci();