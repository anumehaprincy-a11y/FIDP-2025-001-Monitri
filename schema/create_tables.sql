-- ============================================================
-- FIDP-2025-001 | Monitri FinOps Intelligence Dashboard
-- Schema: 4 CREATE TABLE Statements
-- Author: Anumeha Princy, PMP®
-- Tool: DB Browser for SQLite
-- Data Period: January – May 2025
-- ============================================================

-- TABLE 1: Client SLA/SLO Performance
-- Tracks SLA compliance across 350 clients
CREATE TABLE IF NOT EXISTS client_sla (
    id                  INTEGER PRIMARY KEY AUTOINCREMENT,
    Client_ID           TEXT NOT NULL,
    Client_Name         TEXT NOT NULL,
    Region              TEXT NOT NULL,
    Client_Type         TEXT NOT NULL,
    contracted_uptime   TEXT NOT NULL,
    actual_uptime       TEXT NOT NULL,
    SLA_Breached        TEXT NOT NULL,
    Breach_Severity     TEXT,
    Month               TEXT NOT NULL
);

-- TABLE 2: Vendor Performance
-- Tracks 5 vendor SLA delivery across Jan-May 2025
CREATE TABLE IF NOT EXISTS vendor_performance (
    id                      INTEGER PRIMARY KEY AUTOINCREMENT,
    Vendor_ID               TEXT NOT NULL,
    Vendor_Name             TEXT NOT NULL,
    Service_Type            TEXT NOT NULL,
    Contracted_SLA          TEXT NOT NULL,
    Actual_Uptime           TEXT NOT NULL,
    Incident_Count          INTEGER DEFAULT 0,
    Monthly_Cost_USD        TEXT NOT NULL,
    SLA_Breached            TEXT NOT NULL,
    Performance_Score       REAL NOT NULL,
    Month                   TEXT NOT NULL
);

-- TABLE 3: CI/CD Pipeline Health
-- Tracks 225 deployment records across all teams
CREATE TABLE IF NOT EXISTS cicd_pipeline (
    id                      INTEGER PRIMARY KEY AUTOINCREMENT,
    Deployment_ID           TEXT NOT NULL,
    Deployment_Date         TEXT NOT NULL,
    Environment             TEXT NOT NULL,
    Team                    TEXT NOT NULL,
    Deployment_Status       TEXT NOT NULL,
    Incidents_Triggered     INTEGER DEFAULT 0,
    Downtime_Minutes        INTEGER DEFAULT 0,
    Clients_Affected        INTEGER DEFAULT 0,
    Root_Cause              TEXT,
    Month                   TEXT NOT NULL
);

-- TABLE 4: Data Anomaly Log
-- Tracks 72 data anomalies across all regions
CREATE TABLE IF NOT EXISTS data_anomalies (
    id                      INTEGER PRIMARY KEY AUTOINCREMENT,
    Anomaly_ID              TEXT NOT NULL,
    Detected_Date           TEXT NOT NULL,
    Client_ID               TEXT,
    Region                  TEXT NOT NULL,
    Anomaly_Type            TEXT NOT NULL,
    Severity                TEXT NOT NULL,
    Description             TEXT,
    Detection_Time          TEXT,
    Resolution_Time         TEXT,
    Action_Taken            TEXT,
    Month                   TEXT NOT NULL
);
