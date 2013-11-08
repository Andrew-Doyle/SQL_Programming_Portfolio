CREATE OR REPLACE TRIGGER trigger2
AFTER INSERT OR UPDATE ON athlete
FOR EACH ROW
BEGIN
	IF :NEW.salary > 250000 THEN
	dbms_output.put_line('This is a message from the club owners, the new employee, with an ID of: ' 
	|| :NEW.athlete_id || ' has a ridicolously high salary: €' || :NEW.salary || ' It better be worthwhile or your getting fired!');
	END IF;
END;
/
INSERT INTO 
athlete (athlete_name, athlete_role, salary, transfer_cost, market_value, team_id, manager_id) 
VALUES('Lionel Messi', 'Magician', 275000, 50000000, 40000000, 1, 1);