-- Question 3

DECLARE encountered NUMBER;

BEGIN
<<outer>>
FOR i IN 1 .. 30 LOOP
	encountered := 0;
	<<inner>>
		FOR j In 2..i-1 LOOP
			IF MOD(i,j) = 0 THEN
			dbms_output.put_line(i);
		encountered := 1;
		END IF;
		EXIT WHEN encountered =1;
		END LOOP inner;
	END LOOP outer;

END;
/
    