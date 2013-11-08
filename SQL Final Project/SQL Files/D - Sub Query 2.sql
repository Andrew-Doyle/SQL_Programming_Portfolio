
SELECT fitness_plan.fitness_plan_name, workout.workout_name
FROM workout INNER JOIN (fitness_plan INNER JOIN fitness_plan_workout ON fitness_plan.fitness_plan_id = fitness_plan_workout.fitness_plan_id) ON workout.workout_id = fitness_plan_workout.workout_id
WHERE workout_name IN
(
SELECT workout_name
FROM workout
WHERE workout_name = 'Yoga 1'
);