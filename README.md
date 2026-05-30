# 🛒 Superstore Sales Analysis

![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python) ![SQL](https://img.shields.io/badge/SQL-SQLite-orange?logo=sqlite) ![PowerBI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow?logo=powerbi) ![Sheets](https://img.shields.io/badge/Google%20Sheets-Analysis-green?logo=googlesheets)

**Personal Data Analyst Portfolio Project**  
Analysis of 9,994 sales transactions to uncover business insights across product categories, regions, and customer segments.

---

## 📌 Project Overview

| Item | Detail |
|---|---|
| **Dataset** | Superstore Sales Dataset (Kaggle) |
| **Records** | 9,994 transactions |
| **Period** | 2014–2017 |
| **Tools** | Python, Pandas, SQLite, Power BI, Google Sheets |
| **Goal** | Find actionable business insights from sales data |

---

## 🔍 Key Findings

| # | Insight | Detail |
|---|---|---|
| 1 | Technology drives profit | Highest margin at 17.4% — 4 of top 5 products |
| 2 | Clear seasonality | Peak in November every year — plan stock accordingly |
| 3 | Furniture is a weak spot | Only 2.5% margin — Central Region sells at a loss (-1.75%) |
| 4 | Central Region underperforms | Margin 7.92% vs West 14.94% — discount policy issue |
| 5 | Corporate is the best segment | Highest Sales per Customer at $2,992 |

---

## 📊 Power BI Dashboard

Interactive dashboard with Region slicer — click any region to filter all visuals instantly.

**KPIs tracked:** Total Sales · Total Profit · Profit Margin %

| Region | Sales | Profit | Margin |
|---|---|---|---|
| **Overall** | $2.30M | $286.40K | 12.47% |
| West | $725.46K | $108.42K | 14.94% |
| East | $678.78K | $91.52K | 13.48% |
| South | $391.72K | $46.75K | 11.93% |
| Central | $501.24K | $39.71K | 7.92% |

### Overall Dashboard
![Overall](Overall.jpg)

### By Region
| West | East |
|---|---|
| ![West](West.jpg) | ![East](East.jpg) |

| Central | South |
|---|---|
| ![Central](Central.jpg) | ![South](South.jpg) |

---

## 📋 Google Sheets Analysis

Summary analysis built with SUMIF formulas and Pivot Table.

**Skills demonstrated:** SUMIF · Pivot Table · Profit Margin formula · Bar Chart

| Category | Total Sales | Total Profit | Profit Margin |
|---|---|---|---|
| Technology | $836,154 | $145,454 | 17.40% |
| Office Supplies | $719,047 | $122,490 | 17.04% |
| Furniture | $741,999 | $18,451 | **2.49%** ⚠️ |

> **Insight:** Furniture generates the lowest profit margin at 2.49% despite being the 2nd highest in sales — indicating a discount or cost structure problem.

---

## 🔎 SQL Analysis

Key questions answered with SQL queries using SQLite:

| Query | Finding |
|---|---|
| Sales & Profit by Category | Technology leads in profit margin at 17.4% |
| Monthly Sales Trend | November peak every year — seasonal pattern confirmed |
| Top 5 Products by Profit | Canon imageCLASS 2200 is #1 at $25,199 profit |
| Sales & Profit by Region | West is best; Central has the lowest margin |
| Customer Segment Analysis | Corporate segment has highest Sales per Customer |

---

## 📈 Visualizations

### Sales & Profit by Category
![Category](images/q1_category.png)

### Monthly Sales Trend (2014–2017)
![Monthly](images/q2_monthly_trend.png)

### Top 5 Products by Profit
![Top Products](images/q3_top_products.png)

### Sales & Profit by Region
![Region](images/q4_region.png)

### Customer Segment Analysis
![Segment](images/q5_segment.png)

---

## 💡 Business Recommendations

1. **Furniture** — Review discount policy, especially in Central Region
2. **Central Region** — Stop discounting Furniture, push Technology sales
3. **Canon imageCLASS** — Target Corporate segment with demo/ROI presentation
4. **Low Season** — Run promotions in Jan–Feb to boost slow months
5. **Corporate Segment** — Prioritize for highest Sales per Customer

---

## 📁 Project Structure

```
superstore-sales-analysis/
├── README.md
├── images/                    # SQL analysis charts
│   ├── q1_category.png
│   ├── q2_monthly_trend.png
│   ├── q3_top_products.png
│   ├── q4_region.png
│   └── q5_segment.png
├── results/                   # SQL query results
├── Superstore_Dashboard.pbix  # Power BI Dashboard
├── Overall.jpg                # Dashboard screenshot - All regions
├── West.jpg                   # Dashboard screenshot - West
├── East.jpg                   # Dashboard screenshot - East
├── Central.jpg                # Dashboard screenshot - Central
└── South.jpg                  # Dashboard screenshot - South
```

---

*Project by Sarunsx | Data Analyst Portfolio*  
*Tools: Python · Pandas · SQLite · Power BI · Google Sheets*

