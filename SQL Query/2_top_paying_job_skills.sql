-- 2.question
--What  Skills are required for the top-paying data analyst
-- Use the top 10 Highest paying Data anlayst jobs from the first query
--Add the specific skills required for these roles
--why it provides a detailed look at which high paying jobs demand certain skills
--helping job seekers understand which skills to develop that align with top salaries


WITH top_paying_jobs AS (
  SELECT job_id,
    job_title,
    salary_year_avg,
    name AS company_name
  FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
  WHERE 
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
  ORDER BY salary_year_avg DESC
  LIMIT 10
)
SELECT 
  top_paying_jobs.*,
  skills
FROM top_paying_jobs
  left JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
  LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
  WHERE skills is NOT NULL
  ORDER BY salary_year_avg DESC;

-- Top Paying Skills in Data Analyst field
-- If someone wants to qualify for top-paying analyst roles, the minimum competitive stack based on your data is:
-- SQL
-- Python
-- Tableau
-- Basic Cloud (Azure or Snowflake exposure)
-- Excel






