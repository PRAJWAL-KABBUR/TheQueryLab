# Write your MySQL query statement below
select distinct l1.num as ConsecutiveNums from Logs l1
join Logs l2 on l1.id = l2.id - 1
join Logs l3 ON l1.id = l3.id - 2
where l1.num = l2.num and l1.num = l3.num;

/*
SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT num,
           LAG(num, 1) OVER (ORDER BY id) AS prev1,
           LAG(num, 2) OVER (ORDER BY id) AS prev2
    FROM Logs
) t
WHERE num = prev1
  AND num = prev2;
*/