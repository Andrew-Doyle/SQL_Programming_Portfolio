SELECT athlete.athlete_name, athlete.athlete_role, team.team_name
FROM team FULL OUTER JOIN athlete ON team.team_id = athlete.team_id;

