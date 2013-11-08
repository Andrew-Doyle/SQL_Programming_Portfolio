SELECT diet.diet_name, sports_science.sports_scientist_name,sports_science.role
FROM diet RIGHT OUTER JOIN sports_science ON diet.sports_scientist_id = sports_science.sports_scientist_id;
