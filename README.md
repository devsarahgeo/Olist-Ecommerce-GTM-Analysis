# 🛒 Ecommerce Marketplace ETL Pipeline & GTM (Go-To-Market) Analysis 

## 🧭 Request Type
Ad-hoc request : Required to complete within 7 days

## 🧭 Executive Summary 
<p>
This analysis examines Brazilian e-commerce marketplace data from 2016–2018, focusing on GMV, order volume, cancellations, and repeat buyers to understand core marketplace performance and customer behavior patterns.

Pre-2019 data was selected to establish a clean baseline, free from pandemic-era distortions that emerged after 2020.

</p>

---

### 💼 Business Problem
<p>
Olist marketplace wanted to understand trends in order volumes, cancellations, and repeat buyers over time, as these metrics affect revenue and customer retention. Without this insight, management cannot identify growth opportunities or operational challenges.
  
Key Questions:
<ul>
  <li> Which sellers and product categories drive the most GMV and revenue?</li>
  
  <li> How order volumes and cancellations are trending month-to-month?</li>
  
  <li> How repeat customers behave and which segments are most valuable?</li>
</ul

Answering these questions helps the business identify growth opportunities, reduce operational issues (like cancellations), and improve customer retention.

<b>Core Challenge</b>: How can the marketplace increase revenue, reduce cancellations, and retain more customers?
</p>

---
## ❓ Analysis Questions 
<p>
  
#### GMV:
Which sellers contribute the most to GMV?

Which product categories drive the highest GMV?

How does GMV trend over months? Are there seasonal spikes?

#### Order Volume & Growth

How many orders are placed per month?

How many new vs returning customers are placing orders?

#### Customer Behavior

What is the repeat buyer rate per month?

Which cities or regions have the highest number of active buyers?

Do certain product categories have higher repeat purchases?

#### Operational / Cancellation Metrics

What is the order cancellation rate over time?

Are cancellations clustered by seller? Which seller regions are slower to ship?

Which product categories have the most canceled orders?

#### Delivery / Logistics

What is the average delivery time?

Are certain sellers or cities experiencing delays?


#### Customer Segmentation / Clustering

Can we segment buyers into high-value / mid-value / low-value groups using RFM (Recency, Frequency, Monetary)?

Which segments contribute most to GMV?


</p>

---

## ⚙️ Methodology 

Designed a multi-table analytical model using SQL (joins, CTEs, window functions) and Python to derive core e-commerce metrics. Conducted category, regional, and customer segmentation analysis to identify GTM opportunities and growth signals, and communicated insights via Looker dashboards.

<h3>1. Dataset Used:</h3> 
Olist Dataset - https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce/

<h3>2. Architecture Diagram:</h3>
<img width="863" height="747" alt="Screenshot 2026-01-27 at 12 15 14 PM" src="https://github.com/user-attachments/assets/4f361c8a-4a83-4d78-a5b6-8a27fed42b3a" />

<h3>3. Database (Postgres) Snapshot</h3>
<img width="1461" height="814" alt="Screenshot 2026-01-29 at 5 14 20 PM" src="https://github.com/user-attachments/assets/65e1e763-07a8-4db0-90fb-7d74d2534433" />

## 💻 Git File Structure Explained:

analysis/olist_analysis : This code generates answers for each analysis question and can also be used to validate the final bi analysis results.

analysis/olist_analysis_for_bi: This code generates combined tables to answer multiple business questions for use in a BI tool.

final_demo/Olist-Ecommerce-Analysis: Final demo/business insights showcase made by storing data in Google BigQuery and using Looker to visualize.

---

## 🧠 Skills & Tech Stack
<ul>
  <li><strong>Visual Studio Code</strong> – Central development environment</li>
    <li><strong>PostgreSQL</strong> – Raw Data Store</li>
  <li><strong>BigQuery</strong> – Cloud Data Warehouse</li>

  <li><strong>Looker</strong> – Data visualization and storytelling</li>
  <li><strong>SQL and Python</strong> – Analytical querying</li>
</ul>

---

## 📈 Results

Looker Report Snapshot:


<img width="974" height="872" alt="Screenshot 2026-01-29 at 2 09 56 PM" src="https://github.com/user-attachments/assets/b76e3feb-d43a-4e8c-b9c8-501076d8d2bc" />

<img width="973" height="878" alt="Screenshot 2026-01-29 at 2 10 03 PM" src="https://github.com/user-attachments/assets/3632ecca-9132-41a2-be19-241ab89230b7" />

<img width="963" height="879" alt="Screenshot 2026-01-29 at 2 33 16 PM" src="https://github.com/user-attachments/assets/b6e31d8f-85fd-4a4d-88c6-b9f09e8ee55c" />

<img width="974" height="657" alt="Screenshot 2026-01-29 at 2 10 14 PM" src="https://github.com/user-attachments/assets/aa8d2ba3-db1e-4f78-bbf0-2ac850875ae6" />


---

## 📊 Business Insights & Recommendations


<u>**Key Metrics / Highlights**</u>:

| **Metric**                   | **Highlight**                           |
| ---------------------------- | --------------------------------------- |
| **Top Seller GMV**           | 227k                                    |
| **Top Product Category**     | Health & Beauty                         |
| **Highest Repeat Purchases** | Arts & Craftsmanship                    |
| **Peak Sales Months**        | May & August                            |
| **Highest Cancellations**    | Sports Leisure product category         |
| **Top Cities**               | Sao Paulo & Rio de Janeiro              |


**Business Insights, Impact & Recommendations**:

New Customers -> drive majority of GMV
-> New customers drive the majority(~31%) of GMV, making customer acquisition a primary growth lever. 

Launch targeted campaigns to acquire new customers.

Repeat Customers -> October peak
-> Repeat customer activity peaks in October, indicating opportunities for targeted retention and promotional strategies. October retention peak suggests timing loyalty campaigns before Q4.

Customer activity concentrated in Sao Paulo & Rio de Janeiro
-> Customer demand is highly concentrated in Sao Paulo and Rio de Janeiro, revealing both strong core markets and untapped regional expansion opportunities. 

**Recommendations**:

- **Segment-Specific Marketing:** Implement marketing strategies tailored to each RFM segment to maximize revenue growth and efficiency.

  -  **Retention of At-Risk High-Value Customers**: Re-engage “Cannot Lose Them” customer segment through targeted campaigns before they churn.
  
  -  **Upsell & Monetize Frequent Buyers**: Increase spending among Potential Loyalists via personalized recommendations, cross-selling, and promotions.

- **Leverage Peak Months**: Run special offers, loyalty programs, and targeted campaigns in May and August to capitalize on high GMV periods.

- **Geography-Focused Strategy**: Strengthen retention, logistics, and seller support in Sao Paulo and Rio de Janeiro while expanding acquisition efforts in emerging cities.

- **Address Cancellations**: Investigate high-cancellation products and sellers, focusing on logistics, inventory management, and category-specific interventions.

---

## ⚡ Future Scope - Scalable Implementation 
*(If the project expands by adding more historical years)*

<ul>
<li> Data Validation: Add CI/CD checks for schema, nulls, and aggregation sanity.</li>

<li> Cloud Data Warehouse: Store raw and transformed (BI-ready) tables directly in BigQuery or Snowflake, skipping local Postgres for scalability.</li>

</ul>




