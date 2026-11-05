SELECT account_name, account_type, balance FROM accounts WHERE user_id = 1;

SELECT t.transaction_date, t.description, t.amount, c.name AS category
FROM transactions t
LEFT JOIN categories c ON t.category_id = c.id
WHERE t.account_id = 1
ORDER BY t.transaction_date DESC
LIMIT 10;

SELECT c.name AS category, SUM(t.amount) AS total_spent
FROM transactions t
JOIN categories c ON t.category_id = c.id
WHERE strftime('%Y-%m', t.transaction_date) = strftime('%Y-%m', 'now')
GROUP BY c.name
ORDER BY total_spent DESC;

INSERT INTO transactions (account_id, category_id, amount, transaction_date, description)
VALUES (1, 2, -45.50, '2024-11-02', 'Grocery shopping');
