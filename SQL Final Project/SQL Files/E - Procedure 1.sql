
CREATE OR REPLACE PROCEDURE new_meal_plan (p_meal_plan_id IN NUMBER, p_meal_plan_name IN VARCHAR2 )
IS
BEGIN
	INSERT INTO meal_plan (meal_plan_id, meal_plan_name) VALUES (p_meal_plan_id, p_meal_plan_name);
	EXCEPTION
	WHEN value_error THEN DBMS_OUTPUT.PUT_LINE('TRY AGAIN! That is the wrong type of input!');
END;
/

BEGIN
new_meal_plan(13,'Full Irish Breakfast');
END;
/


