# Write your MySQL query statement below
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM ( 
select  id,name,salary,departmentId,
DENSE_RANK() 
over (partition by departmentId order by salary desc) as rnk
    from Employee
) e
join Department d 
    on e.departmentId = d.id
where e.rnk <= 3;