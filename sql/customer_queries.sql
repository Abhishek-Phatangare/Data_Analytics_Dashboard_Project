CREATE DATABASE customer_analytics;
GO

USE customer_analytics;

CREATE TABLE customer_behavior (
    customer_id INT,
    age INT,
    gender VARCHAR(20),
    item_purchased VARCHAR(100),
    category VARCHAR(50),
    purchase_amount DECIMAL(10,2),
    location VARCHAR(50),
    size VARCHAR(10),
    color VARCHAR(20),
    season VARCHAR(20),
    review_rating DECIMAL(2,1),
    subscription_status VARCHAR(10),
    shipping_type VARCHAR(50),
    discount_applied VARCHAR(10),
    promo_code_used VARCHAR(10),
    previous_purchases INT,
    payment_method VARCHAR(50),
    frequency_of_purchases VARCHAR(50)
);

SELECT SUM(purchase_amount) AS total_revenue
FROM customer_behavior;

SELECT gender,
       SUM(purchase_amount) AS revenue
FROM customer_behavior
GROUP BY gender;

SELECT TOP 5
       category,
       SUM(purchase_amount) AS revenue
FROM customer_behavior
GROUP BY category
ORDER BY revenue DESC;

SELECT subscription_status,
       COUNT(*) AS total_customers
FROM customer_behavior
GROUP BY subscription_status;

SELECT category,
       ROUND(AVG(review_rating),2) AS avg_rating
FROM customer_behavior
GROUP BY category;
