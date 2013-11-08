BEGIN

<<outer>>
FOR i IN 1 .. 10 LOOP
      <<inner>>
   FOR j IN 1 .. 10 LOOP
      dbms_output.put_line(I || ‘.’ || j);
   END LOOP inner;
END LOOP outer;

END;
/