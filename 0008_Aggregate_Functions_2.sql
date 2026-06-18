select
    department_id,
    sum(salary) as total_salary,
    count(employee_id) as total_emp_count,
    count(case when salary is null or salary = 0 then 1 else null end) as null_emp,
    coalesce(sum(case when salary is null or salary = 0 then 1 else null end), 0) as null_emp2,
    min(salary) as min_salary,
    max(salary) as max_salary,
    round(avg(salary),2) as avg_salary,
    min(hire_date) as min_hire,
    max(hire_date) as max_hire

from hr.employees
group by 1
;

SELECT
    department_id,
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary,
    ROUND(AVG(salary), 0) AS avg_salary
FROM hr.employees
WHERE salary IS NOT NULL AND salary > 0
GROUP BY department_id
HAVING COUNT(*) > 3
ORDER BY total_salary DESC;