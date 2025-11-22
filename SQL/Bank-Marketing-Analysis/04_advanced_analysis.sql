-- Advanced SQL analysis with CTEs and window functions

-- 1. Age bucket distribution
WITH age_buckets AS (
    SELECT 
        width_bucket(age, 18, 95, 10) AS age_bucket,
        COUNT(*) AS total
    FROM bank
    GROUP BY width_bucket(age, 18, 95, 10)
)
SELECT * FROM age_buckets ORDER BY age_bucket;

-- 2. Conversion rate by age group (segmentation)
WITH age_groups AS (
    SELECT 
        CASE
            WHEN age < 25 THEN '18-24'
            WHEN age < 35 THEN '25-34'
            WHEN age < 45 THEN '35-44'
            WHEN age < 55 THEN '45-54'
            WHEN age < 65 THEN '55-64'
            ELSE '65+'
        END AS age_group,
        target
    FROM bank
)
SELECT 
    age_group,
    COUNT(*) AS total,
    SUM(CASE WHEN target = 'yes' THEN 1 END) AS subscribed,
    ROUND(100.0 * SUM(CASE WHEN target = 'yes' THEN 1 END) / COUNT(*), 2) AS conversion_rate
FROM age_groups
GROUP BY age_group
ORDER BY age_group;

-- 3. Ranking job categories by conversion rate
WITH job_stats AS (
    SELECT 
        job,
        COUNT(*) AS total,
        SUM(CASE WHEN target = 'yes' THEN 1 END) AS subscribed,
        ROUND(100.0 * SUM(CASE WHEN target = 'yes' THEN 1 END) / COUNT(*), 2) AS conversion_rate
    FROM bank
    GROUP BY job
)
SELECT *,
       RANK() OVER (ORDER BY conversion_rate DESC) AS conversion_rank
FROM job_stats
ORDER BY conversion_rank;

-- 4. Identify high-value customers (balance threshold)
SELECT *
FROM bank
WHERE balance > (
    SELECT AVG(balance) FROM bank
)
ORDER BY balance DESC
LIMIT 10;
