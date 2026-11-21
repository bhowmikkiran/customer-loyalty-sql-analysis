-- Customer Loyalty & Churn-Risk Tracker: table definitions (MySQL 8.x)
-- Source: DBMS Mini Project Report, section 4.2

DROP DATABASE IF EXISTS loyalty_tracker;
CREATE DATABASE loyalty_tracker;
USE loyalty_tracker;

CREATE TABLE customer_master (
    customer_id INT PRIMARY KEY,
    year_birth INT NOT NULL,
    education VARCHAR(20) NOT NULL,
    marital_status VARCHAR(20) NOT NULL,
    income INT NOT NULL,
    kids_home INT DEFAULT 0,
    teens_home INT DEFAULT 0
);

CREATE TABLE product_category_master (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE campaign_master (
    campaign_id INT PRIMARY KEY,
    campaign_name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE customer_activity (
    activity_id INT PRIMARY KEY,
    customer_id INT NOT NULL UNIQUE,
    recency_days INT NOT NULL,
    deals_purchases INT DEFAULT 0,
    web_purchases INT DEFAULT 0,
    catalog_purchases INT DEFAULT 0,
    store_purchases INT DEFAULT 0,
    web_visits_month INT DEFAULT 0,
    FOREIGN KEY (customer_id) REFERENCES customer_master(customer_id)
);

CREATE TABLE customer_spending (
    spending_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    category_id INT NOT NULL,
    amount INT NOT NULL DEFAULT 0,
    FOREIGN KEY (customer_id) REFERENCES customer_master(customer_id),
    FOREIGN KEY (category_id) REFERENCES product_category_master(category_id)
);

CREATE TABLE campaign_response (
    response_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    campaign_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer_master(customer_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_master(campaign_id)
);
