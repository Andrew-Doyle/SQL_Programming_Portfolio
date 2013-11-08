
CREATE OR REPLACE PROCEDURE q7_salary_over_ninety_k
IS
BEGIN
	UPDATE employee SET salary = ‘90000’;
END q7_salary_over_ninety_k;
/

--Declare the Exception
DECLARE
q7_exception EXCEPTION;
--Begin the cursor
BEGIN
DECLARE
CURSOR lab_5_q7 IS  -- Declaration of cursor name
-- Below, the columns are selected from the employee table
SELECT emp_id, fname, sname, manager_emp_id, salary FROM employee;
-- Below, a variable is declared which represents every column in a row
q7_cursor lab_5_q7 %ROWTYPE; 

BEGIN -- sub-block begins
OPEN lab_5_q7;
FETCH lab_5_q7 INTO q7_cursor; 
WHILE  lab_5_q7 %FOUND LOOP
	IF q7_cursor.salary < 20000 THEN RAISE_APPLICATION_ERROR
	(-123456,’You have employees with salaries < €20,000, you should pay them more than that!’);
		   END IF;
IF q7_cursor.salary >90000 THEN RAISE q7_exception;
END IF;
FETCH lab_5_q7 INTO q7_cursor;
			   
END LOOP;
CLOSE lab_5_q7; 
	END; -- sub-block ends

EXCEPTION
	WHEN q7_exception THEN
BEGIN
	q7_salary_over_ninety_k;
RAISE; -- reraise the current exception
END;

/
