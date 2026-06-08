# FIDP-2025-001 | Monitri FinOps Intelligence Dashboard

Author: Anumeha Princy, PMP® | Operations PM | Sunnyvale, CA
Status: Complete
Data Period: January–May 2025
Environment: Simulated Enterprise BaaS Platform
 
Show Image
Show Image
Show Image
Show Image
---
The Problem
Without a centralized intelligence dashboard, ops teams at BaaS companies rely on manual spreadsheet scanning to detect issues — a process that takes 3 to 4 days from detection to resolution. By that point, clients have already experienced the impact and the team is reacting, not leading.

The Solution
FIDP-2025-001 is an end-to-end operational intelligence platform built to show how an Operations PM uses data to investigate incidents, communicate with stakeholders, make vendor decisions, and document outcomes.

Live Dashboard
🔗 View Live Looker Studio Dashboard
Show Image
SLA/SLO Performance Tracker — 52 of 350 clients breached SLA across Jan–May 2025
Show Image
Vendor Scorecard — Jumio identified as most persistent underperformer (4 consecutive breaches)
Show Image
CI/CD Health Monitor — 16 failed deployments, 1,769 minutes total downtime
Show Image
Data Anomaly Alerts — 7 High/Critical anomalies escalated to VP Engineering

Tech Stack
LayerToolData SourceGoogle Sheets (4 datasets, 672 records)DatabaseSQLite — DB Browser v3.13.1SQL Queries25 queries across 5 categoriesDashboardLooker Studio — 4 modulesProject ManagementJira (F20MFD board)DocumentationConfluence (6 pages)ArchitectureDraw.io + MiroVersion ControlGitHub

System Architecture
Data Pipeline:
Google Sheets → CSV Import → SQLite (25 SQL Queries) → Looker Studio (4 Modules) → Stakeholders (COO · VP Engineering · Head of Client Success)

Key Metrics
MetricResultMean Detection Time3–4 days → 15 minutesTotal Downtime Quantified29.5 hours across 16 failed deploymentsClient-Initiated Escalations0Platform SLA Breach Rate14.86% (52 of 350 clients)Highest Risk SegmentPayment Providers — 21.74% breach rateHighest Risk RegionFrance — 26.67% breach rateVendor TerminatedJumio — failed 90-day performance watch

Three Operational Scenarios
Scenario A — DEP-0109 | P1 Production Failure | F20MFD-1

Root Cause: Network timeout during third-party API call
Impact: 195 minutes downtime · 58 clients affected
Outcome: Detected in 15 minutes. Resolved same day. 0 client escalations.

Scenario B — DEP-0104 | P2 Production Failure | F20MFD-2

Root Cause: SSL certificate validation failure
Impact: 230 minutes downtime (longest in dataset) · 39 clients affected
Outcome: Detected in 15 minutes. Resolved same day. Auto certificate validation added to pipeline.

Scenario C — Jumio KYC Vendor Termination | F20MFD-3

Breach Period: February–May 2025 — 4 consecutive months
Watch Period: June–August 2025 — failed 2 of 3 months
Outcome: COO approved termination September 10, 2025. Offboarded November 2025.


Jira Board
Show Image
F20MFD board — 3 of 3 tickets DONE

Confluence Project Wiki
Show Image
6-page project wiki — Project Home, PM Documents, Data & SQL, Scenarios, Dashboard, Lessons Learned

Folder Structure
FIDP-2025-001-Monitri/
├── queries/              # 25 SQL queries across 5 categories
├── schema/               # SQLite table creation scripts
├── screenshots/          # Dashboard, Jira, and Confluence screenshots
├── Monitri_*.pdf         # PM documents, proof artifacts, case study
├── Monitri_*.xlsx        # Metric trackers
└── README.md

Results

Detection time improved 92% — 3–4 days manual → 15 minutes via FIDP dashboard
Zero client-initiated escalations across all incidents
Full vendor governance cycle completed — Jumio breach → formal review → 90-day watch → termination
Stripe identified as dual risk — vendor SLA breach AND #1 CI/CD root cause (4 occurrences)
14.86% platform SLA breach rate baselined for Q3 2025 improvement target


Project Links
ToolLinkLive DashboardLooker StudioJira BoardF20MFD-1 · F20MFD-2 · F20MFD-3Confluence WikiFIDP-2025-001 Monitri FinOps DashboardIncident Response WorkflowMiro Board

FIDP-2025-001 · Simulated Enterprise Environment · Anumeha Princy, PMP® · June 2026
