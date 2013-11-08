SELECT training_session.training_session_name, manager.manager_name, manager.manager_description
FROM manager FULL OUTER JOIN training_session ON manager.manager_id = training_session.manager_id;

