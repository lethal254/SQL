WITH job_posting_q1 AS  (
    SELECT * FROM january_jobs
    UNION ALL
    SELECT * FROM february_jobs
    UNION ALL
    SELECT * FROM march_jobs
)
SELECT 
*,
salary_year_avg::INT
 FROM job_posting_q1
WHERE salary_year_avg > 70000