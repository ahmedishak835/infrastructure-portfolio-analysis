-- 1. Query 1: Avg Delay & Over Budget by Sector and Region
SELECT
    Sector,
    Region,
    ROUND(AVG(Delay_Days), 1) AS Avg_Delay,
    ROUND(AVG(Percent_Over_Budget), 1) AS Avg_Over_Budget,
    ROUND(AVG(Cost_Variance_m), 2) AS Avg_Cost_Variance
FROM
    Projects
GROUP BY
    Sector, Region
ORDER BY
    Avg_Over_Budget DESC;

-- 2. Query 2: Avg Delay & Satisfaction by Sector and Region
SELECT
    Sector,
    Region,
    ROUND(AVG(Delay_Days), 1) AS Avg_Delay,
    ROUND(AVG(Satisfaction_Score), 1) AS Avg_Satisfaction
FROM
    Projects
GROUP BY
    Sector, Region
ORDER BY
    Avg_Satisfaction ASC;

-- 3. Query 3: Max Delay Project
SELECT
    Project_ID, Delay_Days
FROM
    Projects
ORDER BY
    Delay_Days DESC
LIMIT 1;

-- 4. Query 4: Max % Over Budget Project
SELECT
    Project_ID, Percent_Over_Budget
FROM
    Projects
WHERE
    Percent_Over_Budget = (SELECT MAX(Percent_Over_Budget) FROM Projects);
