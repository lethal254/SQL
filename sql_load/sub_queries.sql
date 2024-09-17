WITH job_postings AS (
    SELECT 
    job_id
    FROM
    job_postings_fact
    WHERE job_work_from_home = true AND job_title_short = 'Data Analyst'
)

SELECT
skills_dim.skill_id,
skills_dim.skills AS skills_,
COUNT(DISTINCT job_postings.job_id) as job_count
FROM skills_dim
INNER JOIN skills_job_dim ON skills_job_dim.skill_id = skills_dim.skill_id
INNER JOIN job_postings ON job_postings.job_id = skills_job_dim.job_id
GROUP BY skills_dim.skill_id
ORDER BY job_count DESC
limit 5;