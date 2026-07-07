# Write your MySQL query statement below
SELECT s.user_id,
ROUND(IFNULL(c.confirmed / c.total, 0), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN (
SELECT user_id,
COUNT(*) AS total,
SUM(action = 'confirmed') AS confirmed
FROM Confirmations
GROUP BY user_id) c
ON s.user_id = c.user_id;