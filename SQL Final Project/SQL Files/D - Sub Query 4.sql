
SELECT *
FROM meal_plan
WHERE EXISTS
(
SELECT *
FROM diet_meal
WHERE diet_id = 4
AND meal_plan.meal_plan_id = diet_meal.meal_plan_id
);