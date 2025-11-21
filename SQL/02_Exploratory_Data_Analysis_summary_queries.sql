-- Basic EDA for the Bank Marketing Dataset

-- Total rows
SELECT COUNT(*) AS total_rows FROM bank;

-- Preview sample rows
SELECT * FROM bank LIMIT 10;

-- Check for missing values
SELECT 
    SUM(CASE WHEN age IS NULL THEN 1 END) AS missing_age,
    SUM(CASE WHEN job IS NULL THEN 1 END) AS missing_job,
    SUM(CASE WHEN marital IS NULL THEN 1 END) AS missing_marital,
    SUM(CASE WHEN education IS NULL THEN 1 END) AS missing_education,
    SUM(CASE WHEN balance IS NULL THEN 1 END) AS missing_balance
FROM bank;

-- Summary statistics (numerical)
SELECT 
    MIN(age) AS min_age, MAX(age) AS max_age, AVG(age) AS avg_age,
    MIN(balance) AS min_balance, MAX(balance) AS max_balance, AVG(balance) AS avg_balance,
    MIN(duration) AS min_duration, MAX(duration) AS max_duration, AVG(duration) AS avg_duration
FROM bank;

-- Value counts for categorical variables
SELECT job, COUNT(*) AS cnt
FROM bank GROUP BY job ORDER BY cnt DESC;

SELECT marital, COUNT(*) AS cnt
FROM bank GROUP BY marital ORDER BY cnt DESC;

SELECT education, COUNT(*) AS cnt
FROM bank GROUP BY education ORDER BY cnt DESC;

-- Target distribution
SELECT target, COUNT(*) AS total
FROM bank GROUP BY target;

