SELECT athlete_role, athlete_name,count(*) AS nbr_role, SUM(salary) 
FROM  athlete
GROUP BY CUBE(athlete_role,athlete_name)
ORDER BY athlete_role;