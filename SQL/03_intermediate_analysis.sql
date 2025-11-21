-- Intermediate analysis for customer segmentation

-- Frequency of job types
SELECT job, COUNT(*) AS total
FROM bank
GROUP BY job
ORDER BY total DESC;

-- Conversion rate by job
SELECT 
    job,
    COUNT(*) AS total,
    SUM(CASE WHEN target = 'yes' THEN 1 ELSE 0 END) AS subscribed,
    ROUND(100.0 * SUM(CASE WHEN target = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS conversion_rate
FROM bank
GROUP BY job
ORDER BY conversion_rate DESC;

-- Conversion by marital status
SELECT 
    marital,
    COUNT(*) AS total,
    SUM(CASE WHEN target = 'yes' THEN 1 END) AS subscribed,
    ROUND(100.0 * SUM(CASE WHEN target = 'yes' THEN 1 END) / COUNT(*), 2) AS conversion_rate
FROM bank
GROUP BY marital
ORDER BY conversion_rate DESC;

-- Conversion by education level
SELECT 
    education,
    COUNT(*) AS total,
    SUM(CASE WHEN target = 'yes' THEN 1 END) AS subscribed,
    ROUND(100.0 * SUM(CASE WHEN target = 'yes' THEN 1 END) / COUNT(*), 2) AS conversion_rate
FROM bank
GROUP BY education
ORDER BY conversion_rate DESC;


-- Contact method effectiveness
SELECT 
    contact,
    COUNT(*) AS total,
    SUM(CASE WHEN target = 'yes' THEN 1 END) AS subscribed,
    ROUND(100.0 * SUM(CASE WHEN target = 'yes' THEN 1 END) / COUNT(*), 2) AS conversion_rate
FROM bank
GROUP BY contact
ORDER BY conversion_rate DESC;


