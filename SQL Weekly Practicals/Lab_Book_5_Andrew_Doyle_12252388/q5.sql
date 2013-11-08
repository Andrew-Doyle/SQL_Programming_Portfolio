ALTER TABLE employee ADD salary NUMBER(10);

DESCRIBE employee;

SELECT * FROM employee;

UPDATE employee SET salary='10000' WHERE emp_id=304;
UPDATE employee SET salary='20000' WHERE emp_id=305;
UPDATE employee SET salary='30000' WHERE emp_id=300;
UPDATE employee SET salary='40000' WHERE emp_id=301;
UPDATE employee SET salary='50000' WHERE emp_id=302;
UPDATE employee SET salary='60000' WHERE emp_id=303;
UPDATE employee SET salary='90000' WHERE emp_id=401;
UPDATE employee SET salary='110000' WHERE emp_id=310;

CREATE OR REPLACE TRIGGER q5trigger
	AFTER INSERT OR UPDATE ON employee
	FOR EACH ROW
BEGIN
	IF :NEW.salary > 100000 THEN
	dbms_output.put_line(:NEW.emp_id || ' ' || :NEW.salary);
	END IF;
END;
/

INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID, SALARY) VALUES('Pandaaa', 'Bearaa', 304,160000);