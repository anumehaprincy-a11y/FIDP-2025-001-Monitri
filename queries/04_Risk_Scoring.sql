-- ============================================================
-- FIDP-2025-001 | Monitri FinOps Intelligence Dashboard
-- Category: Risk Scoring — Early Warning System
-- Author: Anumeha Princy, PMP®
-- Purpose: Where is client trust most at risk right now?
-- ============================================================

-- Q16: Top 10 Clients by Uptime Gap
SELECT client_id, client_name, client_type, region,
       ROUND((Contracted - Actual), 2) AS Uptime_Gap
FROM (
    SELECT client_id, client_name, client_type, region,
           CAST(REPLACE(contracted_uptime, '%', '') AS REAL) AS Contracted,
           CAST(REPLACE(actual_uptime, '%', '') AS REAL) AS Actual
    FROM client_sla
)
ORDER BY Uptime_Gap DESC
LIMIT 10;

-- ============================================================

-- Q17: Clients with Both SLA Breach AND Data Anomaly
SELECT DISTINCT client_sla.client_id, client_name, client_sla.region,
       client_type, breach_severity,
       data_anomalies.Anomaly_Type, data_anomalies.Severity, Action_Taken
FROM client_sla
JOIN data_anomalies ON client_sla.client_id = data_anomalies.Client_ID
WHERE SLA_Breached = 'Yes';

-- ============================================================

-- Q18: Vendors with Declining Performance Score
SELECT Vendor_ID, Vendor_Name, Service_Type,
       AVG(CASE WHEN Month = 'Jan-2025' THEN Performance_Score END) AS Jan_Score,
       AVG(CASE WHEN Month = 'May-2025' THEN Performance_Score END) AS May_Score,
       ROUND(AVG(CASE WHEN Month = 'May-2025' THEN Performance_Score END) -
             AVG(CASE WHEN Month = 'Jan-2025' THEN Performance_Score END), 1) AS Score_Change
FROM vendor_performance
GROUP BY Vendor_ID
HAVING Score_Change < 0
ORDER BY Score_Change ASC;

-- ============================================================

-- Q19: Deployments with High Downtime AND High Client Impact
SELECT Deployment_ID, Downtime_Minutes, Clients_Affected,
       Deployment_Date, Environment, Team, Root_Cause
FROM cicd_pipeline
WHERE Downtime_Minutes > 100
AND Clients_Affected > 20
ORDER BY Clients_Affected DESC;

-- ============================================================

-- Q20: Months with Failed Deployments AND High Anomalies
SELECT a.Month, a.Failed_Deployments, b.High_Anomalies
FROM
  (SELECT Month, COUNT(*) AS Failed_Deployments
   FROM cicd_pipeline
   WHERE Deployment_Status = 'Failed'
   GROUP BY Month) a
JOIN
  (SELECT Month, COUNT(*) AS High_Anomalies
   FROM data_anomalies
   WHERE Severity IN ('High', 'Critical')
   GROUP BY Month) b
ON a.Month = b.Month
ORDER BY a.Month;
