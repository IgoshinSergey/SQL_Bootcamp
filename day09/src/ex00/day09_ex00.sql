CREATE TABLE person_audit (
    created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    type_event CHAR(1) DEFAULT 'I',
    row_id BIGINT NOT NULL,
    name VARCHAR NOT NULL,
    age INTEGER NOT NULL,
    gender VARCHAR NOT NULL,
    address VARCHAR,
    CONSTRAINT ch_type_event CHECK(type_event = 'I' OR type_event = 'D' OR type_event = 'U')
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER 
AS $$
BEGIN
	IF (TG_OP = 'INSERT') THEN
		INSERT INTO person_audit 
		SELECT now(), 'I', NEW.*;
	END IF;
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
	FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

-- SELECT * FROM person_audit;
