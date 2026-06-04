-- ============================================================
-- FIDP-2025-001 | Monitri FinOps Intelligence Dashboard
-- Category: Analytics — Trend Analysis
-- Author: Anumeha Princy, PMP®
-- Purpose: What patterns predict where risk is heading?
-- ============================================================

-- Q10: Overall SLA Breach Rate
SELECT ROUND(100.0 * SUM(CASE WHEN SLA_Breached = 'Yes' THEN 1 ELSE 0 END)
       / COUNT(*), 2) AS "Breach_Rate_%"
FROM client_sla;

-- ============================================================

-- Q11: SLA Breach Count and Rate by Client Type
SELECT Client_Type,
       SUM(CASE WHEN SLA_Breached = 'Yes' THEN 1 ELSE 0 END) AS Breach_Count,
       ROUND(100.0 * SUM(CASE WHEN SLA_Breached = 'Yes' THEN 1 ELSE 0 END)
       / COUNT(*), 2) AS "Breach_Rate_%"
FROM client_sla
GROUP BY Client_Type;

-- ============================================================

-- Q12: SLA Breach Count and Rate by Region
SELECT Region,
       SUM(CASE WHEN SLA_Breached = 'Yes' THEN 1 ELSE 0 END) AS Breach_Count,
       ROUND(100.0 * SUM(CASE WHEN SLA_Breached = 'Yes' THEN 1 ELSE 0 END)
       / COUNT(*), 2) AS "Breach_Rate_%"
FROM client_sla
GROUP BY Region;

-- ============================================================

-- Q13: Average Uptime Gap by Client Type
SELECT Client_Type,
       ROUND(AVG(Contracted - Actual), 2) AS Avg_Uptime_Gap
FROM (
    SELECT Client_Type,
           CAST(REPLACE(contracted_uptime, '%', '') AS REAL) AS Contracted,
           CAST(REPLACE(actual_uptime, '%', '') AS REAL) AS Actual
    FROM client_sla
)
GROUP BY Client_Type;

-- ============================================================

-- Q14: Recurring Root Causes in CI/CD Failures
SELECT Root_Cause, COUNT(*) AS Frequency
FROM cicd_pipeline
WHERE Deployment_Status = 'Failed'
GROUP BY Root_Cause
ORDER BY Frequency DESC;

-- ============================================================

-- Q15: Anomaly Resolution Time Trend by Month
SELECT Month,
       ROUND(AVG(CAST(REPLACE(Resolution_Time, ' hours', '') AS REAL)), 2)
       AS Avg_Resolution_Hrs
FROM data_anomalies
GROUP BY Month
ORDER BY Month;
