select first_name, last_name from hr.employees where phone_number is not null order by salary limit 10; --order by salary desc= buyukten kucuge
SELECT
    first_name,
    last_name,
    salary AS monthly_salary, --new column
    salary * 12 AS annual_salary
FROM
    hr.employees
WHERE
    salary IS NOT NULL
ORDER BY
    annual_salary DESC;