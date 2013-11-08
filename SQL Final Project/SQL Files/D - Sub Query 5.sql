
SELECT a.athlete_name
FROM athlete a
GROUP BY a.athlete_name
HAVING SUM (a.market_value) >= ALL
(
SELECT AVG (b.market_value)
FROM athlete b
WHERE a.athlete_name <> b.athlete_name
);
