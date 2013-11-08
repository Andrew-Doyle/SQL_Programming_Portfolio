
SELECT meal_plan.meal_plan_name, diet_meal.diet_id
FROM meal_plan LEFT OUTER JOIN diet_meal
ON meal_plan.meal_plan_id = diet_meal.meal_plan_id;