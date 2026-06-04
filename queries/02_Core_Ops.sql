-- ============================================================
-- FIDP-2025-001 | Monitri FinOps Intelligence Dashboard
-- Category: Core Ops — Daily Operational Monitoring
-- Author: Anumeha Princy, PMP®
-- Purpose: What is broken right now and who is affected?
-- ============================================================

-- Q5: All Clients with SLA Breach
SELECT client_id, client_name, region, client_type,
       contracted_uptime, actual_uptime, breach_severity, month
FROM client_sla
WHERE SLA_Breached = 'Yes';

-- ============================================================

-- Q6: Failed CI/CD Deployments with Client Impact
SELECT Deployment_ID, Deployment_Date, Environment, Team,
       Downtime_Minutes, Clients_Affected, Root_Cause
FROM cicd_pipeline
WHERE Deployment_Status = 'Failed'
AND Clients_Affected > 0;

-- ============================================================

-- Q7: Unresolved High and Critical Anomalies
SELECT Anomaly_ID, Detected_Date, Client_ID, Region,
       Anomaly_Type, Severity, Action_Taken
FROM data_anomalies
WHERE Severity IN ('High', 'Critical')
AND Action_Taken LIKE '%Escalated%';

-- ============================================================

-- Q8: Vendors Currently Breaching SLA
SELECT Vendor_ID, Vendor_Name, Service_Type,
       Incident_Count, Month, SLA_Breached
FROM vendor_performance
WHERE SLA_Breached = 'Yes';

-- ============================================================

-- Q9: CI/CD Failures with Highest Client Impact — May 2025
SELECT Deployment_ID, Deployment_Date, Environment, Team,
       Downtime_Minutes, Clients_Affected, Root_Cause, Month
FROM cicd_pipeline
WHERE Deployment_Status = 'Failed'
AND Clients_Affected > 0
AND Month = 'May-2025'
ORDER BY Clients_Affected DESC;
