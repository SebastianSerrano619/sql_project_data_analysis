/*
Answer: what are the top skills based on salary
-Look at the average salary associated with each skill for Data Analyst positions 
-Focuses on roles with specified salaries, regardless of location
-WHy? It reveals how different skills impact salary levels for Data Analyst and
    helps identify the most financially rewarding skills to acquire or improve
*/


SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary_yearly
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg iS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY
    avg_salary_yearly DESC
LIMIT 25