# Write your MySQL query statement below
WITH cte AS (
SELECT student_id, subject,
FIRST_VALUE(score) over (
 PARTITION BY student_id, subject
 ORDER BY exam_date
) AS first_score,
FIRST_VALUE(score) over (
PARTITION BY student_id, subject
ORDER BY exam_date DESC) as latest_score,
COUNT(*) OVER (
partition BY student_id, subject
) AS exam_count
FROM Scores
)
SELECT DISTINCT student_id,subject,first_score,latest_score
FROM cte
WHERE exam_count >= 2
and latest_score > first_score
order by student_id, subject;