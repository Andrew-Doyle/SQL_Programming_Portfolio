
CREATE OR REPLACE PROCEDURE find_athlete
(p_athlete_id IN VARCHAR2,
o_athlete_name OUT VARCHAR2,
o_athlete_role OUT VARCHAR2,
o_transfer_cost OUT VARCHAR2,
o_market_value OUT VARCHAR2
)
AS
BEGIN
	SELECT athlete_name, athlete_role, transfer_cost, market_value
	INTO o_athlete_name,o_athlete_role, o_transfer_cost, o_market_value
	FROM athlete
	WHERE athlete_id = p_athlete_id;
	EXCEPTION
	WHEN OTHERS
	THEN
	DBMS_OUTPUT.PUT_LINE('Error in finding athlete id:
	'||p_athlete_id);
END find_athlete;
/

DECLARE
	temp_out_athlete_name athlete.athlete_name%TYPE;
	temp_out_athlete_role athlete.athlete_role%TYPE;
	temp_out_transfer_cost athlete.transfer_cost%TYPE;
	temp_out_market_value athlete.market_value%TYPE;
BEGIN
	find_athlete 
	(20, temp_out_athlete_name, temp_out_athlete_role, temp_out_transfer_cost, temp_out_market_value);
	DBMS_OUTPUT.PUT_LINE
	('Athlete 20 is: '||temp_out_athlete_name||
	' | '|| temp_out_athlete_role||' | ' || temp_out_transfer_cost ||' | ' || temp_out_market_value ||' | '
	);
END;
/