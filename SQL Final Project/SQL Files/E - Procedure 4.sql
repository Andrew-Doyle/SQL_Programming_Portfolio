
CREATE OR REPLACE PROCEDURE count_defenders 
IS
	temp_count NUMBER;
	BEGIN
	SELECT count(*)
	INTO temp_count
	FROM athlete
	WHERE athlete_role = 'Defender';
	DBMS_OUTPUT.PUT_LINE( 'The number of defenders is: ' || temp_count);
	EXCEPTION	    
    WHEN OTHERS
    THEN
    DBMS_OUTPUT.PUT_LINE('Error in procedure, please examine');
END;
/

EXECUTE count_defenders;