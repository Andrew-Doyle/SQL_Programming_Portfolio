CREATE OR REPLACE PROCEDURE delete_meal_plan (p_meal_plan_id IN NUMBER )
IS
BEGIN
    DELETE FROM meal_plan 
	WHERE meal_plan_id = p_meal_plan_id;
    EXCEPTION
    WHEN value_error THEN DBMS_OUTPUT.PUT_LINE('TRY AGAIN! That is the wrong type of input!');
END;
/

BEGIN
delete_meal_plan(13);
END;
/
