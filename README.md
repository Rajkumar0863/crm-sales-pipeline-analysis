# CRM Sales Pipeline Analysis

> Diagnosing where a B2B sales team loses winnable revenue — and quantifying what it's worth to fix.

**🔗 [View the live interactive dashboard →](https://public.tableau.com/app/profile/rajkumar.vijayan2695/viz/CRMSalesPipelineAnalysis/CRMSalesDashboard)**

---

## Executive Summary
A pipeline analysis of 8,800 B2B CRM opportunities identified inconsistent sales performance and product-specific revenue leakage. Using SQL, Python, and Tableau — with every finding cross-validated across all three — the analysis quantified a conservative **$237K** recoverable revenue opportunity and set out practical recommendations for sales coaching and CRM data quality.

## The Problem
MavenTech rolled out a new CRM but had no visibility into the data outside the platform — leadership couldn't see where deals were won or lost.

## Business Questions
This analysis answers:
- Which products generate the highest lost revenue?
- Which sales agents underperform and need coaching?
- How much revenue can realistically be recovered — and how conservatively can it be estimated?
- Which CRM data-quality issues distort reporting?

## The Data
Maven Analytics *"CRM Sales Opportunities"* — 8,800 B2B deals across four linked tables (opportunities, sales agents, accounts, products).

## Approach
1. **Explore & clean** — loaded and validated the data in Python; caught and fixed a CRM product-naming inconsistency (`GTXPro` vs `GTX Pro`) that was silently breaking table joins.
2. **Diagnose** — analysed the funnel (Prospecting → Engaging → Won / Lost) and isolated two recoverable levers.
3. **Quantify** — reproduced every finding in **SQL** and cross-validated across pandas, SQL, and Tableau (identical results).
4. **Visualise** — built an interactive Tableau dashboard.
5. **Recommend** — packaged the findings into a consulting-style deck.

**Pipeline:** `CSV → SQLite (SQL) → Python (pandas) → Tableau → recommendation deck`

## Key Findings
- **Win rate: 63.2%** on $10.0M of won revenue.
- **Agent inconsistency:** win rates swing 15 points (55%–70%) on the same products and accounts — a coachable gap.
- **Lost-revenue concentration:** three products drive ~$4.9M in losses; **GTX Pro (~$2.0M)** loses the most, and the most per deal.
- **Opportunity: ≥ $237K** recoverable by coaching below-median agents to the team average — a deliberately conservative floor.

## Recommendations
1. Coach bottom-quartile agents toward the team-median playbook.
2. Prioritise GTX Pro win-back given its high revenue-per-lost-deal.
3. Enforce consistent CRM product naming to keep reporting reliable.

## Limitations
The opportunity estimate assumes historical pipeline performance is representative of future performance, and deliberately uses conservative assumptions — counting only below-median agents, lifted only to the team median — so the $237K figure is a floor rather than a ceiling.

## Tech Stack
`SQL (SQLite)` · `Python` · `pandas` · `Tableau Public` · `python-pptx`

## Repository Structure

    crm-sales-pipeline-analysis/
    ├── notebooks/       01_explore.ipynb — full analysis
    ├── sql/             analysis.sql — validated SQL queries
    ├── outputs/         cleaned data + agent summary
    ├── deliverables/    dashboard image + PowerPoint deck
    ├── data/            source CSVs
    └── build_deck.py    generates the recommendation deck

---

**Author:** Rajkumar Vijayan