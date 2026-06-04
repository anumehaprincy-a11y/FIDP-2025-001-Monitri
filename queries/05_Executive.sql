-- ============================================================
-- FIDP-2025-001 | Monitri FinOps Intelligence Dashboard
-- Category: Executive Reporting — Leadership Dashboard
-- Author: Anumeha Princy, PMP®
-- Purpose: Monday morning platform health summary for COO
-- ============================================================

-- Q21: Platform Health Scorecard
SELECT Metric, Actual, Target, Status FROM (
SELECT 'SLA Breach Rate %' AS Metric,
ROUND(100.0*SUM(CASE WHEN SLA_Breached='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS Actual,
'Below 10%' AS Target,
CASE WHEN ROUND(100.0*SUM(CASE WHEN SLA_Breached='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) < 10 THEN 'Green'
     WHEN ROUND(100.0*SUM(CASE WHEN SLA_Breached='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) < 15 THEN 'Amber'
     ELSE 'Red' END AS Status
FROM client_sla
UNION ALL
SELECT 'Failed Deployments with Client Impact', COUNT(*), 'Below 5',
CASE WHEN COUNT(*) < 5 THEN 'Green'
     WHEN COUNT(*) < 10 THEN 'Amber'
     ELSE 'Red' END
FROM cicd_pipeline WHERE Deployment_Status='Failed' AND Clients_Affected > 0
UNION ALL
SELECT 'Escalated High/Critical Anomalies', COUNT(*), 'Zero',
CASE WHEN COUNT(*)=0 THEN 'Green'
     WHEN COUNT(*) < 3 THEN 'Amber'
     ELSE 'Red' END
FROM data_anomalies WHERE Severity IN ('High','Critical') AND Action_Taken LIKE '%Escalated%'
UNION ALL
SELECT 'Vendor SLA Breaches', COUNT(*), 'Zero',
CASE WHEN COUNT(*)=0 THEN 'Green'
     WHEN COUNT(*) < 5 THEN 'Amber'
     ELSE 'Red' END
FROM vendor_performance WHERE SLA_Breached='Yes');

-- ============================================================

-- Q22: Top 3 At-Risk Clients by Combined Risk Score
SELECT DISTINCT client_sla.client_id, client_name, client_sla.region,
       client_type, breach_severity,
       data_anomalies.Anomaly_Type, data_anomalies.Severity,
       CASE WHEN breach_severity='Critical' THEN 3
            WHEN breach_severity='High' THEN 2
            WHEN breach_severity='Medium' THEN 1 ELSE 0 END
       +
       CASE WHEN data_anomalies.Severity='Critical' THEN 3
            WHEN data_anomalies.Severity='High' THEN 2
            WHEN data_anomalies.Severity='Medium' THEN 1 ELSE 0 END
       AS Combined_Risk_Score
FROM client_sla
JOIN data_anomalies ON client_sla.client_id = data_anomalies.Client_ID
WHERE SLA_Breached = 'Yes'
ORDER BY Combined_Risk_Score DESC
LIMIT 3;

-- ============================================================

-- Q23: Vendor Spend vs Performance Ratio
SELECT Vendor_Name, Service_Type,
       ROUND(SUM(CAST(REPLACE(REPLACE(Monthly_Cost_USD,'$',''),',','') AS REAL)),0) AS Total_Spend,
       ROUND(AVG(Performance_Score),1) AS Avg_Score,
       ROUND(SUM(CAST(REPLACE(REPLACE(Monthly_Cost_USD,'$',''),',','') AS REAL))
             / AVG(Performance_Score), 0) AS Cost_Per_Score_Point
FROM vendor_performance
GROUP BY Vendor_ID, Vendor_Name, Service_Type
ORDER BY Cost_Per_Score_Point ASC;

-- ============================================================

-- Q24: Total Client Impact Hours from CI/CD Failures
SELECT
ROUND(SUM(Downtime_Minutes) / 60.0, 1) AS Total_Downtime_Hours,
SUM(Clients_Affected) AS Total_Clients_Affected,
SUM(Incidents_Triggered) AS Total_Incidents
FROM cicd_pipeline
WHERE Deployment_Status = 'Failed'
AND Clients_Affected > 0;

-- ============================================================

-- Q25: Anomaly Resolution Rate by Region
SELECT Region,
       ROUND(AVG(CAST(REPLACE(Resolution_Time, ' hours', '') AS REAL)), 2)
       AS Avg_Resolution_Hrs
FROM data_anomalies
GROUP BY Region
ORDER BY Avg_Resolution_Hrs ASC;
