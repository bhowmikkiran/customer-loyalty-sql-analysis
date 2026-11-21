-- Customer Loyalty & Churn-Risk Tracker: the seven queries (MySQL 8.x)
-- Import loyalty_tracker_dump.sql first (see the README).

USE loyalty_tracker;

-- Query 1: At-Risk Customers
-- Objective: Find customers who have not purchased for more than 60 days but still visit the website more than 6 times a month.
SELECT c.customer_id, c.education, c.income, a.recency_days, a.web_visits_month
FROM customer_master c
  INNER JOIN customer_activity a ON c.customer_id = a.customer_id
WHERE a.recency_days > 60 AND a.web_visits_month > 6
ORDER BY a.recency_days DESC;

-- Query 2: High-Income Wine Buyers
-- Objective: Find customers with income above 60,000 who spent more than 300 on wines.
SELECT c.customer_id, c.marital_status, c.income, p.category_name, s.amount
FROM customer_master c
  INNER JOIN customer_spending s ON c.customer_id = s.customer_id
  INNER JOIN product_category_master p ON s.category_id = p.category_id
WHERE p.category_name = 'Wines' AND s.amount > 300 AND c.income > 60000
ORDER BY s.amount DESC;

-- Query 3: Customers Who Accepted Campaign 5
-- Objective: List the customers who accepted a particular campaign.
SELECT c.customer_id, c.education, c.income, m.campaign_name
FROM customer_master c
  INNER JOIN campaign_response r ON c.customer_id = r.customer_id
  INNER JOIN campaign_master m ON r.campaign_id = m.campaign_id
WHERE m.campaign_name = 'Campaign 5';

-- Query 4: Deal Hunters Who Accepted the Latest Campaign
-- Objective: Find customers who accepted the latest campaign and have made at least 2 purchases using deals.
SELECT c.customer_id, a.deals_purchases, m.campaign_name
FROM customer_master c
  INNER JOIN customer_activity a ON c.customer_id = a.customer_id
  INNER JOIN campaign_response r ON c.customer_id = r.customer_id
  INNER JOIN campaign_master m ON r.campaign_id = m.campaign_id
WHERE m.campaign_name = 'Latest Campaign' AND a.deals_purchases >= 2;

-- Query 5: Families Who Shop Mostly In-Store
-- Objective: Find customers with two or more children at home who buy more from the store than from the website.
SELECT c.customer_id, c.kids_home, c.teens_home, a.store_purchases, a.web_purchases
FROM customer_master c
  INNER JOIN customer_activity a ON c.customer_id = a.customer_id
WHERE (c.kids_home + c.teens_home) >= 2 AND a.store_purchases > a.web_purchases;

-- Query 6: Spending per Category for Post-Graduates
-- Objective: Find the total and average spending in each product category for customers with a Master's or PhD degree.
SELECT p.category_name, COUNT(DISTINCT c.customer_id) AS customers,
       SUM(s.amount) AS total_spent, ROUND(AVG(s.amount), 2) AS avg_spent
FROM customer_master c
  INNER JOIN customer_spending s ON c.customer_id = s.customer_id
  INNER JOIN product_category_master p ON s.category_id = p.category_id
WHERE c.education IN ('Master', 'PhD')
GROUP BY p.category_name
ORDER BY total_spent DESC;

-- Query 7: Loyal Customers Who Accepted Two or More Campaigns
-- Objective: Find customers with income above 30,000 who accepted at least two campaigns.
SELECT c.customer_id, c.income, COUNT(r.campaign_id) AS campaigns_accepted
FROM customer_master c
  INNER JOIN campaign_response r ON c.customer_id = r.customer_id
WHERE c.income > 30000
GROUP BY c.customer_id, c.income
HAVING COUNT(r.campaign_id) >= 2;
