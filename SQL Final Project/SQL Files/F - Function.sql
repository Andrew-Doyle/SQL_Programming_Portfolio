CREATE OR REPLACE FUNCTION nr_training_sessions
RETURN number IS
   total number(2) := 0;
BEGIN
   SELECT count(*) into total
   FROM training_session;
   
   RETURN total;
END;
/

DECLARE
   a number(2);
BEGIN
   a := nr_training_sessions();
   dbms_output.put_line('Total number of unique training sessions: ' || a);
END;
/