
SELECT coaches.coach_name, coaches.role, training_session_coaches.training_session_id
FROM coaches LEFT OUTER JOIN training_session_coaches
ON coaches.coach_id = training_session_coaches.coach_id;