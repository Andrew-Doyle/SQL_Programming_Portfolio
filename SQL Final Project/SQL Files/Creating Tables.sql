-- COACHES TABLE

CREATE TABLE coaches(
	coach_id NUMBER(4) NOT NULL,
	coach_name VARCHAR(30),
	role VARCHAR(30),
	salary NUMBER(6),
	PRIMARY KEY(coach_id )
);

-- FITNESS_COACH TABLE

CREATE TABLE fitness_coach(
	fitness_coach_id NUMBER(2) NOT NULL,
	fitness_coach_name VARCHAR(30),
	education VARCHAR(30),
	salary NUMBER(6),
	PRIMARY KEY(fitness_coach_id)
);

-- MANAGER TABLE

CREATE TABLE manager(
	manager_id NUMBER(4) NOT NULL,
	manager_name VARCHAR(30),
	manager_description VARCHAR(30),
	salary NUMBER(6),
	PRIMARY KEY(manager_id)
);

-- MEAL_PLAN TABLE


CREATE TABLE meal_plan(
	meal_plan_id NUMBER(2) NOT NULL,
	meal_plan_name VARCHAR(70),
	PRIMARY KEY(meal_plan_id)
);

-- SKILL TABLE

CREATE TABLE skill(
	skill_id NUMBER(2) NOT NULL,
	skill_name VARCHAR(20),
	PRIMARY KEY(skill_id)
);

-- SPORTS_SCIENCE TABLE

CREATE TABLE sports_science(
	sports_scientist_id NUMBER(2) NOT NULL,
	sports_scientist_name VARCHAR(30),
	role VARCHAR(40),
	salary NUMBER(6),
	PRIMARY KEY(sports_scientist_id)
);


-- TEAM TABLE

CREATE TABLE team(
	team_id NUMBER(2) NOT NULL,
	team_name VARCHAR(20),
	PRIMARY KEY(team_id)
);

-- TRAINING_SESSION TABLE

CREATE TABLE training_session(
	training_session_id NUMBER(2) NOT NULL,
	training_session_name VARCHAR(30),
	manager_id NUMBER(4),
	PRIMARY KEY(training_session_id),
	FOREIGN KEY(manager_id) REFERENCES manager(manager_id)
);


-- TRAINING_SESSION_SKILL TABLE

CREATE TABLE training_session_skill(
	training_session_id NUMBER(2) NOT NULL,
	skill_id NUMBER(2) NOT NULL,
	PRIMARY KEY(training_session_id,skill_id),
	FOREIGN KEY(training_session_id) REFERENCES training_session(training_session_id),
	FOREIGN KEY(skill_id) REFERENCES skill(skill_id)
);

-- TRAINING_SESSION_COACHS TABLE

CREATE TABLE training_session_coaches(
	training_session_id NUMBER(2) NOT NULL,
	coach_id NUMBER(2),
	PRIMARY KEY(training_session_id),
	FOREIGN KEY(coach_id) REFERENCES coaches(coach_id)
);
 
 -- WORKOUT TABLE
 
 CREATE TABLE workout(
	workout_id NUMBER(2) NOT NULL,
	workout_name VARCHAR(30),
	PRIMARY KEY(workout_id)
);


-- ATHLETE TABLE

CREATE TABLE athlete(
	athlete_id NUMBER(8) NOT NULL, -- 8 digit value allows for 99,999,999 athlete entries
	athlete_name VARCHAR(30),
	athlete_role VARCHAR(20),
	salary NUMBER(6),
	transfer_cost NUMBER(8),
	market_value NUMBER(8),
	team_id NUMBER(2), -- athlete may not be assigned to a team yet, so NULL values allowed
	manager_id NUMBER(4), -- 4 digit value allows for 9,999 manager entries
	PRIMARY KEY(athlete_id)
);
 
-- ATHLETE_MEAL TABLE

CREATE TABLE athlete_meal(
	athlete_id NUMBER(8) NOT NULL,
	meal_plan_id NUMBER(2) NOT NULL,
	scheduled_time VARCHAR(30),
	PRIMARY KEY(athlete_id,meal_plan_id)
);
 
-- ATHLETE_WORKOUT TABLE

CREATE TABLE athlete_workout(
	athlete_id NUMBER(8) NOT NULL,
	workout_id NUMBER(2) NOT NULL,
	times_per_week NUMBER(2),
	PRIMARY KEY(athlete_id,workout_id)
);

-- COACHES_SKILL TABLE

CREATE TABLE coaches_skill(
	coach_id NUMBER(4) NOT NULL,
	skill_id NUMBER(3) NOT NULL,
	PRIMARY KEY(coach_id,skill_id)
);

-- DIET TABLE

CREATE TABLE diet(
	diet_id NUMBER(2) NOT NULL,
	diet_name VARCHAR(30),
	sports_scientist_id NUMBER(2),
	PRIMARY KEY(diet_id)	
);

-- DIET_MEAL TABLE

CREATE TABLE diet_meal(
	diet_id NUMBER(2) NOT NULL,
	meal_plan_id NUMBER(2) NOT NULL,
	PRIMARY KEY(diet_id,meal_plan_id)
);


-- FITNESS_PLAN TABLE

CREATE TABLE fitness_plan(
	fitness_plan_id NUMBER(2) NOT NULL,
	fitness_plan_name VARCHAR(30),
	fitness_coach_id NUMBER(2),
	sports_scientist_id NUMBER(2),
	PRIMARY KEY(fitness_plan_id)
);

-- FITNESS_PLAN_WORKOUT TABLE

CREATE TABLE fitness_plan_workout(
	fitness_plan_id NUMBER(2) NOT NULL,
	workout_id NUMBER(2) NOT NULL,
	PRIMARY KEY(fitness_plan_id,workout_id)
);

ALTER TABLE athlete ADD CONSTRAINT constraint1 FOREIGN KEY (team_id) REFERENCES team(team_id);
ALTER TABLE athlete ADD CONSTRAINT constraint1a FOREIGN KEY (manager_id) REFERENCES manager(manager_id);
ALTER TABLE athlete_meal ADD CONSTRAINT constraint1b FOREIGN KEY(athlete_id) REFERENCES athlete(athlete_id);
ALTER TABLE athlete_meal ADD CONSTRAINT constraint1c FOREIGN KEY(meal_plan_id) REFERENCES meal_plan(meal_plan_id);
ALTER TABLE athlete_workout ADD CONSTRAINT constraint1d FOREIGN KEY(athlete_id) REFERENCES athlete(athlete_id);
ALTER TABLE athlete_workout ADD CONSTRAINT constraint1e FOREIGN KEY(workout_id) REFERENCES workout(workout_id);
ALTER TABLE coaches_skill ADD CONSTRAINT constraint1f FOREIGN KEY(coach_id) REFERENCES coaches(coach_id);
ALTER TABLE coaches_skill ADD CONSTRAINT constraint1g FOREIGN KEY(skill_id) REFERENCES skill(skill_id);
ALTER TABLE diet ADD CONSTRAINT constraint1h FOREIGN KEY(sports_scientist_id) REFERENCES sports_science(sports_scientist_id);
ALTER TABLE diet_meal ADD CONSTRAINT constraint1i FOREIGN KEY(diet_id) REFERENCES diet(diet_id);
ALTER TABLE diet_meal ADD CONSTRAINT constraint1j FOREIGN KEY(meal_plan_id) REFERENCES meal_plan(meal_plan_id);
ALTER TABLE fitness_plan ADD CONSTRAINT constraint1k FOREIGN KEY(fitness_coach_id) REFERENCES fitness_coach(fitness_coach_id);
ALTER TABLE fitness_plan ADD CONSTRAINT constraint1l FOREIGN KEY(sports_scientist_id) REFERENCES sports_science(sports_scientist_id);
ALTER TABLE fitness_plan_workout ADD CONSTRAINT constraint1m FOREIGN KEY(fitness_plan_id) REFERENCES fitness_plan(fitness_plan_id);
ALTER TABLE fitness_plan_workout ADD CONSTRAINT constraint1n FOREIGN KEY(workout_id) REFERENCES workout(workout_id);










