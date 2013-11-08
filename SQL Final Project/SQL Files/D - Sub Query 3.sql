
SELECT a.athlete_name
FROM athlete a
GROUP BY a.athlete_name
HAVING MAX (a.salary) <= ALL
(
SELECT 0.5 * AVG (b.salary)
FROM athlete b
WHERE a.athlete_name <> b.athlete_name
);