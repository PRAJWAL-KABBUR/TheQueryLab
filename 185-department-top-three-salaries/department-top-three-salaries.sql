# Write your MySQL query statement below
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM ( 
select  id,name,salary,departmentId,
DENSE_RANK() 
over (PARTITION BY departmentId 
order by salary DESC
        ) AS rnk
    FROM Employee
) e
JOIN Department d 
    ON e.departmentId = d.id
WHERE e.rnk <= 3;