 -- Second Highest Salary
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee);



-- SELECT
--     (SELECT DISTINCT
--             Salary
--         FROM
--             Employee
--         ORDER BY Salary DESC
--         LIMIT 1 OFFSET 1) AS SecondHighestSalary;

-- SELECT
--     IFNULL(
--       (SELECT DISTINCT Salary
--        FROM Employee
--        ORDER BY Salary DESC
--         LIMIT 1 OFFSET 1),
--     NULL) AS SecondHighestSalary;


select 
Department as "Department",Employee as "Employee",Salary as "Salary"
from (
    select 
        emp.name as Employee, 
        emp.salary as Salary, 
        dep.Name as Department,
        ROW_NUMBER() OVER (PARTITION BY dep.Name  ORDER BY emp.salary DESC ) AS ROW_NUM
    from Employee emp
    join Department dep
    on emp.DepartmentId=dep.id
    )
where ROW_NUM<=3;