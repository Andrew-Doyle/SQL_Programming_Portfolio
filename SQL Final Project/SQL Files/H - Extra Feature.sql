DECLARE
a_athlete_id NUMBER := 4;
a_current_salary NUMBER;
a_salary_grade VARCHAR(50);
BEGIN
	SELECT salary
	INTO a_current_salary
	FROM athlete
	WHERE athlete_id = a_athlete_id;
CASE
	WHEN a_current_salary >= 100000 THEN a_salary_grade := 'A rated salary; over 100k';
	WHEN a_current_salary >= 50000 THEN a_salary_grade := 'B rated salary; 50-100k';
	WHEN a_current_salary >= 25000 THEN a_salary_grade := 'C rated salary; 25-50k';
	WHEN a_current_salary >= 5000 THEN a_salary_grade := 'D rated salary; 5-25k';
	ELSE a_salary_grade := 'F; less than 5k a week, how would ya survive!?';
END CASE;

DBMS_OUTPUT.PUT_LINE ('salary grade is: '||a_salary_grade);
END;