# Spotify Data Analysis Dashboard

## Project Overview

This project analyzes 230,000+ Spotify tracks to identify key drivers of song popularity.

Using PostgreSQL for data preparation and Power BI for visualization, the goal was to answer:

- What genres perform best?
- Does song duration affect popularity?
- Is higher energy associated with higher popularity?
- Which artists dominate average popularity rankings?

---

## Tools Used

- PostgreSQL (Data cleaning & analysis)
- SQL (Aggregations, CASE logic, Top N filtering)
- Power BI (Interactive dashboard & visualization)

---

## Dashboard Overview

The dashboard includes:

- KPI Summary (Total Tracks, Avg Popularity, Avg Energy, Avg Duration)
- Top 10 Genres by Average Popularity
- Top 10 Artists by Average Popularity
- Popularity by Duration Category
- Popularity by Energy Category
- Interactive slicers (Genre, Duration Category)

  <img width="1158" height="651" alt="BIpic" src="https://github.com/user-attachments/assets/0ce64484-e42e-4adf-acc9-1468608aa076" />


---

## Key Insights

- Songs between **3–4 minutes** show the highest average popularity.
- High-energy tracks do not significantly outperform medium-energy tracks.
- **Pop and Rap** genres dominate popularity rankings.
- Popularity distribution is right-skewed (few tracks reach very high popularity).

---

## How to Reproduce

1. Import dataset into PostgreSQL
2. Run SQL scripts in `/sql` folder
3. Open Power BI file in `/powerbi`
4. Connect to your local PostgreSQL instance
