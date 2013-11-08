
SELECT athlete.athlete_name, workout.workout_name, athlete_workout.times_per_week
FROM workout INNER JOIN (athlete INNER JOIN athlete_workout 
ON athlete.athlete_id = athlete_workout.athlete_id) 
ON workout.workout_id = athlete_workout.workout_id
WHERE workout.workout_name = 'Swimming' AND athlete.athlete_role = 'Defender';

