DECLARE
	rand_salary NUMBER;
BEGIN
FOR i IN 1..1000 LOOP
	SELECT DBMS_RANDOM.VALUE(12000,350000) INTO rand_salary FROM DUAL;
	INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID, SALARY) VALUES('GIANT', 'PANDA', 304, rand_salary);
END LOOP;
END;
/
