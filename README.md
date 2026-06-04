# FIDP-2025-001 | Monitri FinOps Intelligence Dashboard

**Author:** Anumeha Princy, PMP® | Operations PM | Sunnyvale, CA  
**Status:** Phase 05 Complete — SQL Queries | Phase 06 Looker Studio In Progress  
**Data Period:** January – May 2025  
**Environment:** Simulated | All data is synthetic

---

## About the Project

I identified a core operations problem in BaaS platforms — teams are reactive because their data is disconnected. I built a platform that centralizes SLA, vendor, pipeline, and anomaly data into one intelligence layer so ops teams can act before clients feel the impact.

Monitri is a fictional AI-powered BaaS company serving 350 clients across the US and Europe. FIDP is the operational intelligence system I designed, built, and documented as a solo portfolio project.

---

## Tech Stack

| Layer | Tool |
|---|---|
| Data Storage | SQLite, Google Sheets |
| Analysis | SQL — 25 queries across 5 categories |
| Visualization | Looker Studio |
| Documentation | Confluence, GitHub |
| Tracking | Jira |
| AI Capstone | Claude API, React, Vercel |

---

## Dataset Summary

| Table | Records | What It Tracks |
|---|---|---|
| client_sla | 350 | SLA/SLO compliance across 350 clients — breach detection, uptime gaps, regional segmentation |
| vendor_performance | 25 | 5 vendors x 5 months — SLA delivery, performance scores, incident counts, monthly spend |
| cicd_pipeline | 225 | CI/CD deployment health — failures, downtime, client impact, root causes |
| data_anomalies | 72 | Data anomaly log — severity, detection time, resolution time, action taken |
| **Total** | **672** | |

---

## SQL Query Categories

| Category | Queries | Purpose |
|---|---|---|
| DDL | 4 | Schema creation — table structure and constraints |
| Core Ops | 5 | Daily monitoring — what is broken right now and who is affected |
| Analytics | 6 | Trend analysis — patterns that predict where risk is heading |
| Risk Scoring | 5 | Early warning — clients, vendors, deployments about to fail |
| Executive | 5 | Leadership dashboard — Monday morning platform health summary |
| **Total** | **25** | |

---

## Key Findings

- **14.86%** overall SLA breach rate across 350 clients
- **Payment Providers** highest breach rate at 21.74%
- **France** highest regional breach rate at 26.67%
- **Stripe API mismatch** — #1 recurring CI/CD root cause (4 occurrences)
- **Jumio** — most underperforming vendor, 4 consecutive SLA breaches, score declined from 8 to 6
- **29.5 hours** total downtime from failed deployments across Jan–May 2025
- **Abundance Investment** — triple risk flag across SLA, anomaly, and uptime gap analyses

---

## Project Status

| Phase | Description | Status |
|---|---|---|
| 01 | Initiation — Project Charter | ✅ Complete |
| 02 | Planning — 5 Governance Documents | ✅ Complete |
| 03 | Data Build — 4 Datasets, 672 Records | ✅ Complete |
| 04 | Architecture — draw.io + Miro | ✅ Complete |
| 05 | Database & Queries — SQLite, 25 SQL Queries | ✅ Complete |
| 06 | Dashboard — Looker Studio, 4 Modules | 🔄 In Progress |
| 07 | Documentation — Confluence, Case Study PDF | ⏳ Upcoming |
| 08 | AI War Room — React App, Vercel | ⏳ Upcoming |

---

## Repository Structure
---

## Author

**Anumeha Princy, PMP®**  
Operations Program Manager | Sunnyvale, CA  
[LinkedIn](https://www.linkedin.com/in/anumeha-princy) | PMP® Certified | Google Data Analytics | IBM Generative AI
