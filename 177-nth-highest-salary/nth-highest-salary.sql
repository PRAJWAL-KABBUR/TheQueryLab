create function getNthHighestSalary(N INT) returns INT
begin
declare offset_val INT;
set offset_val = N - 1;
return(select distinct salary
FROM Employee
order by salary desc limit 1 OFFSET offset_val);
end;