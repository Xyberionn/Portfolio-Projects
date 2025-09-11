# FMCG Weekly Sales Dashboard

Interactive dashboard analyzing weekly sales trends for FMCG products, per SKU and channel.  
Includes 4-week rolling average visualization for trend smoothing.  

---

## Features
- Multi-select dropdowns for SKUs and channels
- Weekly sales trend visualization
- 4-week rolling mean to smooth trends
- Hover info displays: date, units sold, SKU, and channel
- Dashboard ready for portfolio and presentation

---

## Data
- Dataset: FMCG sales data (CSV)
- Columns include:
  - `date`: Week date
  - `sku`: Product SKU
  - `channel`: Sales channel (Retail, E-commerce, Discount)
  - `units_sold`: Units sold in the week
  - `promotion_flag`: 1 if promotion was active
  - `is_holiday_peak`: True if holiday peak week
  - Other features for analysis and visualization

> Note: Use a reduced dataset for sharing on GitHub if original data is large.

---

## Tools & Technologies
- Python 3.x
- Pandas
- Matplotlib
- Plotly Dash
- Jupyter Notebook / JupyterDash

---
