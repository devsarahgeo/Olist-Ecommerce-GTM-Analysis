# 🛒 Ecommerce Marketplace ETL Pipeline & GTM (Go-To-Market) Analysis 

## 🧭 Request Type
Ad-hoc request : Required to complete within 7 days

## 🧭 Executive Summary 
<p>
When I was exploring Brazilian E-commerce marketplace current year’s data, the data revealed patterns in orders, cancellations, and repeat buyers. This prompted an analysis of 2016–2018 data to see if these trends held historically. In the historic data, I noticed</b> inconsistencies and gaps in order volumes, high cancellation rates, and unclear patterns in repeat buyers, which made it challenging to fully understand marketplace performance.

To address this, I analyzed the data focusing on GMV (Gross Merchandise Value), order volume, cancellations, and repeat buyers. This analysis highlights top-performing sellers, revenue-driving product categories, and patterns in customer behavior, providing actionable insights to guide business decisions and improve operational efficiency.

Pre-2019 (i.e 2016-2018) Olist actual data was intentionally used to establish a stable baseline, free from pandemic-era distortions, to analyze core marketplace mechanics.
</p>

---

### 💼 Business Problem
<p>
Olist marketplace wanted to understand trends in order volumes, cancellations, and repeat buyers over time, as these metrics affect revenue and customer retention. Without this insight, management cannot identify growth opportunities or operational challenges.
  
Specifically, they need to know:
<ul>
  <li> Which sellers and product categories drive the most GMV and revenue?</li>
  
  <li> How order volumes and cancellations are trending month-to-month?</li>
  
  <li> How repeat customers behave and which segments are most valuable?</li>
</ul

Answering these questions helps the business identify growth opportunities, reduce operational issues (like cancellations), and improve customer retention.

In short: "How can the marketplace increase revenue, reduce cancellations, and retain more customers?"
</p>

---
## ❓ Analysis Questions 
<p>
  
##### GMV:
Which sellers contribute the most to GMV?

Which product categories drive the highest GMV?

How does GMV trend over months? Are there seasonal spikes?

##### Order Volume & Growth

How many orders are placed per month?

How many new vs returning customers are placing orders?

##### Customer Behavior

What is the repeat buyer rate per month?

Which cities or regions have the highest number of active buyers?

Do certain product categories have higher repeat purchases?

##### Operational / Cancellation Metrics

What is the order cancellation rate over time?

Are cancellations clustered by seller? Which seller regions are slower to ship?

Which product categories have the most canceled orders?

##### Delivery / Logistics

What is the average delivery time?

Are certain sellers or cities experiencing delays?


##### Customer Segmentation / Clustering

Can we segment buyers into high-value / mid-value / low-value groups using RFM (Recency, Frequency, Monetary)?

Which segments contribute most to GMV?


</p>

---

## ⚙️ Methodology 

<h3>1. Dataset Used:</h3> 
Olist Dataset - https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce/

<h3>Architecture Diagram:</h3>
<img width="863" height="747" alt="Screenshot 2026-01-27 at 12 15 14 PM" src="https://github.com/user-attachments/assets/4f361c8a-4a83-4d78-a5b6-8a27fed42b3a" />

<h3>Postgres Snapshot</h3>
<img width="1461" height="814" alt="Screenshot 2026-01-29 at 5 14 20 PM" src="https://github.com/user-attachments/assets/65e1e763-07a8-4db0-90fb-7d74d2534433" />


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

## 📂 Business Insights


<u>**Key Metrics / Highlights**</u>:

| **Metric**                   | **Highlight**                           |
| ---------------------------- | --------------------------------------- |
| **Top Seller GMV**           | 227k                                    |
| **Top Product Category**     | Health & Beauty                         |
| **Highest Repeat Purchases** | Arts & Craftsmanship                    |
| **Peak Sales Months**        | May & August                            |
| **Highest Cancellations**    | Sports Leisure product category         |
| **Top Cities**               | Sao Paulo & Rio de Janeiro              |


**Customer Insights**:

New Customers -> drive majority of GMV

Repeat Customers -> October peak

Customer activity concentrated in Sao Paulo & Rio de Janeiro

**Recommendations**:

- **Segment-Specific Marketing:** Implement marketing strategies tailored to each RFM segment to maximize revenue growth and efficiency.

  -  **Retention of At-Risk High-Value Customers**: Re-engage “Cannot Lose Them” customer segment through targeted campaigns before they churn.
  
  -  **Upsell & Monetize Frequent Buyers**: Increase spending among Potential Loyalists via personalized recommendations, cross-selling, and promotions.

- **Leverage Peak Months**: Run special offers, loyalty programs, and targeted campaigns in May and August to capitalize on high GMV periods.

- **Geography-Focused Strategy**: Strengthen retention, logistics, and seller support in Sao Paulo and Rio de Janeiro while expanding acquisition efforts in emerging cities.

- **Address Cancellations**: Investigate high-cancellation products and sellers, focusing on logistics, inventory management, and category-specific interventions.

---
## 📂 Impact

Analysis of 2016–2018 data identifies historical trends in high-value customers, peak sales periods, repeat-buying categories, and key regions. These patterns provide actionable guidance for retention, upselling, and regional strategies that can inform current business decisions.
Comapre with 2025–2026 data to see if the same trends hold and to measure performance.

---

## 📂 Future Scope - Scalable Implementation 
*(If the project expands by adding more historical years)*

<ul>
<li> Data Validation: Add CI/CD checks for schema, nulls, and aggregation sanity.</li>

<li> Cloud Data Warehouse: Store raw and transformed (BI-ready) tables directly in BigQuery or Snowflake, skipping local Postgres for scalability.</li>

</ul>




