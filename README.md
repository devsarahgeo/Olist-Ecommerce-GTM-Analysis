# 🛒 Olist Ecommerce ETL Pipeline & GTM Analysis (Work in progres) 

## 🧭 Request Type
Ad-hoc request : Required to complete within 7 days

## 🧭 Executive Summary 
<p>
A friend who works as a manager at <b>Olist</b> shared their marketplace data with me. <b>I noticed</b> inconsistencies and gaps in order volumes, high cancellation rates, and unclear patterns in repeat buyers, which made it difficult to understand marketplace performance. 

To address this, I analyzed the data focusing on GMV (Gross Merchandise Value), order volume, cancellations, and repeat buyers. This analysis highlights top-performing sellers, revenue-driving product categories, and patterns in customer behavior, providing actionable insights to guide business decisions and improve operational efficiency.
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

## ⚙️ Methodology 

<h3>1. Dataset Used:</h3> 
Olist Dataset - https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce/

<h3>Architecture Diagram:</h3>
<img width="863" height="747" alt="Screenshot 2026-01-27 at 12 15 14 PM" src="https://github.com/user-attachments/assets/4f361c8a-4a83-4d78-a5b6-8a27fed42b3a" />

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



<b>Conclusion:</b>

---

## 📂 Deliverables

---
## 📂 Impact
---

## 📂 Future Scope - Scalable Implementation (if project gets bigger)
<ul>
  <li>Automate ETL: Schedule daily pipelines with Airflow</li>

<li> Data Validation: Add CI/CD checks for schema, nulls, and aggregation sanity.</li>

<li> Cloud Data Warehouse: Store raw and transformed (BI-ready) tables directly in BigQuery or Snowflake, skipping local Postgres for scalability.</li>

</ul>




