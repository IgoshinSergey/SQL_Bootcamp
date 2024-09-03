CREATE VIEW v_persons_male (id, name, age, gender, address) AS
SELECT * 
FROM person
WHERE gender = 'male';

CREATE VIEW v_persons_female (id, name, age, gender, address) AS
SELECT * 
FROM person
WHERE gender = 'female';