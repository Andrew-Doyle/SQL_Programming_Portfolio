CREATE OR REPLACE TRIGGER time_trigger
BEFORE INSERT OR UPDATE OR DELETE ON skill
	DECLARE
	day_of_week VARCHAR2(10);
	BEGIN
	day_of_week := RTRIM(TO_CHAR(SYSDATE, 'DAY'));
	IF day_of_week LIKE ('S%') THEN
	RAISE_APPLICATION_ERROR
	(-20000, 'This table cannot be modified at the weekend');
	END IF;
END;
/

INSERT INTO skill (skill_id, skill_name)
VALUES (7,'Super Skills');