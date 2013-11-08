
CREATE OR REPLACE PROCEDURE diet_names IS 
CURSOR cursor_diets IS
	SELECT *
	FROM diet;
	implement_diets cursor_diets%ROWTYPE;

	BEGIN
	OPEN cursor_diets;
		LOOP
			FETCH cursor_diets INTO implement_diets;
			EXIT WHEN cursor_diets%NOTFOUND;
			DBMS_OUTPUT.put_line(implement_diets.diet_name);
		END LOOP;
	CLOSE cursor_diets;
END;
/