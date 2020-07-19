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


SELECT
    d.Name AS 'Department', e1.Name AS 'Employee', e1.Salary
FROM
    Employee e1
        JOIN
    Department d ON e1.DepartmentId = d.Id
WHERE
    3 > (SELECT
            COUNT(DISTINCT e2.Salary)
        FROM
            Employee e2
        WHERE
            e2.Salary > e1.Salary
                AND e1.DepartmentId = e2.DepartmentId
        )
;


select  
ROUND(
    ifnull(
    (
        select 
                count(*) as number_of_acceptance
            from
            (
                select distinct requester_id, accepter_id
                from request_accepted
            ) a
    )    
    /(
        select 
            count(*) as number_of_requests
        from
        (
            select distinct sender_id, send_to_id
            from friend_request
        ) b
    ), 
  0),
2) as accept_rate;   