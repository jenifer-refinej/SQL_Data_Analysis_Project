-- 3 question i.
-- find the count of the number of remote job postings per skill
--Display the top 5 skills by their demand in remote jobs
--Include skill ID,name and count of postings requiring the skill

WITH remote_job_skills AS (
    SELECT 
        sj.skill_id,
        COUNT(*) AS skill_count
    FROM skills_job_dim AS sj
    INNER JOIN job_postings_fact AS jp ON jp.job_id = sj.job_id
    WHERE 
        jp.job_work_from_home = true
        AND jp.job_title_short = 'Data Analyst'
    GROUP BY sj.skill_id
)
SELECT 
    rjs.skill_id,
    s.skills AS skill_name,
    rjs.skill_count
FROM remote_job_skills AS rjs
INNER JOIN skills_dim AS s ON s.skill_id = rjs.skill_id
ORDER BY rjs.skill_count DESC
LIMIT 5;  



-- 3.question ,ii,
-- what are the most in-demand skills for data analystz?
-- -join job postings to inner jon table similar to query 2
--identify the top 5 in-demand skills for  a data anlayst.
--focus on all job postings
--why? retrives the top 5 skills with the highest demand in the job market,
-- providing insights into the most valuable skills for job seekers.

select 
 skills,
 count(skills_job_dim.job_id) AS demand_count
 FROM
job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
job_title_short = 'Data Analyst'
GROUP BY
 skills
 ORDER BY 
 demand_count DESC
LIMIT 5;