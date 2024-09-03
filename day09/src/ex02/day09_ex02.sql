CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
RETURNS TRIGGER 
AS $$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		INSERT INTO person_audit 
		SELECT now(), 'D', OLD.*;
	END IF;
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit
AFTER DELETE ON person
	FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;

-- SELECT * FROM person_audit;