# CRM Sales Pipeline Analysis

Diagnosing where a B2B sales team loses winnable revenue — and quantifying what it's worth to fix.

**🔗 [View the live interactive dashboard](https://public.tableau.com/app/profile/rajkumar.vijayan2695/viz/CRMSalesPipelineAnalysis/CRMSalesDashboard)**

---

## The Problem
MavenTech rolled out a new CRM but had no visibility into the data outside the platform — leadership couldn't see where deals were won or lost.

## The Data
Maven Analytics "CRM Sales Opportunities" — 8,800 B2B deals across four linked tables (opportunities, sales agents, accounts, products).

## Approach
1. **Explore & clean** — loaded and validated the data in Python; caught and fixed a CRM product-naming inconsistency (`GTXPro` vs `GTX Pro`) that was silently breaking table joins.
2. **Diagnose** — analysed the funnel (Prospecting → Engaging → Won / Lost) and isolated two recoverable levers.
3. **Quantify** — cross-validated every figure between pandas and Tableau.
4. **Visualise** — built an interactive Tableau dashboard.
5. **Recommend** — packaged findings into a consulting-style deck.

## Key Findings
- **Win rate: 63.2%** on $10.0M of won revenue.
- **Agent inconsistency:** win rates swing 15 points (55%–70%) on the same products and accounts — a coachable gap.
- **Lost-revenue concentration:** three products drive ~$4.9M in losses; **GTX Pro (~$2.0M)** loses the most, and the most per deal.
- **Opportunity: ≥ $237K** recoverable by coaching below-median agents to the team average — a deliberately conservative floor.

## Recommendations
1. Coach bottom-quartile agents toward the team-median playbook.
2. Prioritise GTX Pro win-back given its high revenue-per-lost-deal.
3. Enforce consistent CRM product naming to keep reporting reliable.

## Tech Stack
Python (pandas), Tableau Public, python-pptx

## Repository Structure
├── notebooks/ # 01_explore.ipynb — full analysis
├── outputs/ # cleaned data + agent summary
├── build_deck.py # generates the recommendation deck
├── deliverables/ # dashboard image + PowerPoint deck
└── data/ # source CSVs


---
**Author:** Rajkumar Vijayan