
SELECT athlete_name
FROM athlete
WHERE salary = 
( SELECT MAX (salary) FROM athlete
);