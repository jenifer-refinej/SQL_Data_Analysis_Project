--1 question

--Identify the top 10 highest paying Data Analyst  roles that are avaiable remotely.
--Focuses on job postings with speified salaries (remove nulls).
--Why? Highlght the top-paying opportunities for data analyst, offering insights into employees


SELECT 
   job_id,
   job_title,
   job_location,
   salary_year_avg,
   job_schedule_type,
   job_posted_date,
   name as company_name
 FROM job_postings_fact
 LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
 WHERE
   job_title_short = 'Data Analyst' AND
   job_location ='Anywhere' AND
   salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC LIMIT 10


-- select round(max(salary_year_avg)) AS highest_salary,
--      job_work_from_home,job_title_short FROM job_postings_fact
-- WHERE job_title_short ='Data Analyst' 
-- AND job_location = 'Anywhere'
-- AND salary_year_avg is NOT NULL
-- GROUP BY salary_year_avg,job_title_short,job_work_from_home
-- order BY salary_year_avg desc
--  LIMIT 10;


