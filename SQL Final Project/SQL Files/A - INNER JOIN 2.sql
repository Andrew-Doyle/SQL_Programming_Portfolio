
-- INNER JOIN QUERY 2
SELECT diet.diet_name, meal_plan.meal_plan_name
FROM meal_plan 
INNER JOIN (diet INNER JOIN diet_meal ON diet.diet_id = diet_meal.diet_id) 
ON meal_plan.meal_plan_id = diet_meal.meal_plan_id;

