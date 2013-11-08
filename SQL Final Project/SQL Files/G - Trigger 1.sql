CREATE SEQUENCE a2
START WITH 41
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER athlete_insert
BEFORE INSERT ON athlete
FOR EACH ROW
	BEGIN
	:NEW.athlete_id:=a2.NEXTVAL;
END;
/
BEGIN
INSERT INTO 
athlete (athlete_name, athlete_role, salary, transfer_cost, market_value, team_id, manager_id) 
VALUES('The New Guy', 'All Positions', 5000, 5000000, 4000000, 1, 1);
END;
/