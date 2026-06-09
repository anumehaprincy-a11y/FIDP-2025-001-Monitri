# FIDP-2025-001 | Monitri FinOps Intelligence Dashboard

**Author:** Anumeha Princy, PMP® | Operations PM | Sunnyvale, CA  
**Status:** Complete  
**Data Period:** January–May 2025  
**Environment:** Simulated Enterprise BaaS Platform  

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Anumeha%20Princy-blue)](https://www.linkedin.com/in/anumeha-princy-pmp-650315110)
[![Dashboard](https://img.shields.io/badge/Looker%20Studio-Live%20Dashboard-green)](https://datastudio.google.com/reporting/1bb9107c-bb54-44c7-869b-641a73f20fa2)
[![Jira](https://img.shields.io/badge/Jira-F20MFD%20Board-blue)](https://anumehaprincy.atlassian.net/browse/F20MFD-1)
[![Confluence](https://img.shields.io/badge/Confluence-Project%20Wiki-blue)](https://anumehaprincy.atlassian.net)

---

## The Problem

Without a centralized intelligence dashboard, ops teams at BaaS companies rely on manual spreadsheet scanning to detect issues — a process that takes **3 to 4 days** from detection to resolution. By that point, clients have already experienced the impact and the team is reacting, not leading.

---

## The Solution

FIDP-2025-001 is an end-to-end operational intelligence platform built to show how an Operations PM uses data to investigate incidents, communicate with stakeholders, make vendor decisions, and document outcomes.

---

## Live Dashboard

🔗 **[View Live Looker Studio Dashboard](https://datastudio.google.com/reporting/1bb9107c-bb54-44c7-869b-641a73f20fa2)**

![SLA Tracker](screenshots/SLA%20Tracker.png)
*SLA/SLO Performance Tracker — 52 of 350 clients breached SLA across Jan–May 2025*

![Vendor Scorecard](screenshots/Vendor%20Scorecard.png)
*Vendor Scorecard — Jumio identified as most persistent underperformer (4 consecutive breaches)*

![CI/CD Health Monitor](screenshots/CICD%20Monitor.png)
*CI/CD Health Monitor — 16 failed deployments, 1,769 minutes total downtime*

![Data Anomaly Alerts](screenshots/DataAnomaly%20Tracker.png)
*Data Anomaly Alerts — 7 High/Critical anomalies escalated to VP Engineering*

---

## Tech Stack

| Layer | Tool |
|---|---|
| Data Source | Google Sheets (4 datasets, 672 records) |
| Database | SQLite — DB Browser v3.13.1 |
| SQL Queries | 25 queries across 5 categories |
| Dashboard | Looker Studio — 4 modules |
| Project Management | Jira (F20MFD board) |
| Documentation | Confluence (6 pages) |
| Architecture | Draw.io + Miro |
| Version Control | GitHub |

---

## System Architecture

**Data Pipeline:**  
Google Sheets → CSV Import → SQLite (25 SQL Queries) → Looker Studio (4 Modules) → Stakeholders (COO · VP Engineering · Head of Client Success)

---

## Key Metrics

| Metric | Result |
|---|---|
| Mean Detection Time | 3–4 days → 15 minutes |
| Total Downtime Quantified | 29.5 hours across 16 failed deployments |
| Client-Initiated Escalations | 0 |
| Platform SLA Breach Rate | 14.86% (52 of 350 clients) |
| Highest Risk Segment | Payment Providers — 21.74% breach rate |
| Highest Risk Region | France — 26.67% breach rate |
| Vendor Terminated | Jumio — failed 90-day performance watch |

---

## Three Operational Scenarios

### Scenario A — DEP-0109 | P1 Production Failure | F20MFD-1
- **Root Cause:** Network timeout during third-party API call
- **Impact:** 195 minutes downtime · 58 clients affected
- **Outcome:** Detected in 15 minutes. Resolved same day. 0 client escalations.

### Scenario B — DEP-0104 | P2 Production Failure | F20MFD-2
- **Root Cause:** SSL certificate validation failure
- **Impact:** 230 minutes downtime (longest in dataset) · 39 clients affected
- **Outcome:** Detected in 15 minutes. Resolved same day. Auto certificate validation added to pipeline.

### Scenario C — Jumio KYC Vendor Termination | F20MFD-3
- **Breach Period:** February–May 2025 — 4 consecutive months
- **Watch Period:** June–August 2025 — failed 2 of 3 months
- **Outcome:** COO approved termination September 10, 2025. Offboarded November 2025.

---

## Jira Board

![Jira Board](screenshots/Jira%20Tickets.png)
*F20MFD board — 3 of 3 tickets DONE*

---

## Confluence Project Wiki

![Confluence](screenshots/Confluence.png)
*6-page project wiki — Project Home, PM Documents, Data & SQL, Scenarios, Dashboard, Lessons Learned*

---

## Folder Structure

- queries/ — 25 SQL queries across 5 categories
- schema/ — SQLite table creation scripts  
- screenshots/ — Dashboard, Jira, and Confluence screenshots
- Monitri_*.pdf — PM documents, proof artifacts, case study
- Monitri_*.xlsx — Metric trackers
- README.md

---

## Results

- **Detection time improved 92%** — 3–4 days manual → 15 minutes via FIDP dashboard
- **Zero client-initiated escalations** across all incidents
- **Full vendor governance cycle completed** — Jumio breach → formal review → 90-day watch → termination
- **Stripe identified as dual risk** — vendor SLA breach AND #1 CI/CD root cause (4 occurrences)
- **14.86% platform SLA breach rate** baselined for Q3 2025 improvement target

---

## Project Links

| Tool | Link |
|---|---|
| Live Dashboard | [Looker Studio](https://datastudio.google.com/reporting/1bb9107c-bb54-44c7-869b-641a73f20fa2) |
| Jira Board | [F20MFD-1 · F20MFD-2 · F20MFD-3](https://anumehaprincy.atlassian.net/browse/F20MFD-1) |
| Confluence Wiki | [FIDP-2025-001 Monitri FinOps Dashboard](https://anumehaprincy.atlassian.net) |
| Incident Response Workflow | [Miro Board](https://miro.com/app/board/uXjVHMQc_Pg=/?share_link_id=431907947706) |

---

*FIDP-2025-001 · Simulated Enterprise Environment · Anumeha Princy, PMP® · June 2026*
