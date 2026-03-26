--Question 4
--What are the top skills based on salary?
--look at the average salary associated with each skill for data analyst positions
--focuses on roles wth specified salaries,regardless of location
--why it reveals how different skills impact salary levels for data analysts 
--and helps identify the most financially rewarding skills to acuquire or improve
SELECT skills,
    round(avg(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 15;

-- The Report for top paying skill
-- Top-tier salary leaders: PySpark (208K) and Bitbucket (189K) stand out as the highest-paying skills, indicating strong demand for big data processing and version control expertise in high-paying roles.

-- Mid-high salary cluster (150K–160K): Tools like Couchbase, Watson, DataRobot, GitLab, Swift, Jupyter, and Pandas show consistently high salaries, highlighting the value of data science, AI platforms, and collaborative development environments.

-- Strong foundational & infrastructure skills (130K–145K): Skills such as Elasticsearch, Golang, NumPy, Databricks, Linux, and Kubernetes still command solid salaries, proving that backend, data engineering, and system-level expertise remain highly valuable.