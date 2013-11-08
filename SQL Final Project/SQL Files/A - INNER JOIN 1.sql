
SELECT training_session.training_session_name, skill.skill_name
FROM training_session INNER JOIN (skill INNER JOIN training_session_skill ON skill.skill_id = training_session_skill.skill_id) 
ON training_session.training_session_id = training_session_skill.training_session_id;


