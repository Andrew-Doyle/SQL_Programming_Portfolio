DECLARE
firstname VARCHAR2(50);

BEGIN
SELECT fname INTO firstname FROM employee WHERE emp_id = ‘1200’;

EXCEPTION
	WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE(‘TRY AGAIN! There is no such data!! Your query is wrong!’);

END;
/
