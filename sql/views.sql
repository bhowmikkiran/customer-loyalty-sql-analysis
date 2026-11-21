-- customer_summary: one row per customer with the three inputs for RFM analysis
--   recency   = days since the last purchase
--   frequency = purchases across all four channels (deals, web, catalog, store)
--   monetary  = total spending across all product categories
USE loyalty_tracker;

CREATE OR REPLACE VIEW customer_summary AS
SELECT c.customer_id,
       c.education,
       c.income,
       a.recency_days,
       (a.deals_purchases + a.web_purchases + a.catalog_purchases + a.store_purchases) AS frequency,
       (SELECT SUM(s.amount) FROM customer_spending s WHERE s.customer_id = c.customer_id) AS monetary
FROM customer_master c
  INNER JOIN customer_activity a ON c.customer_id = a.customer_id;
