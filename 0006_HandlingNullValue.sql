select first_name, last_name, phone_number,phone_number_2 from hr.employees;

--COALESCE
select
    first_name|| ' ' || last_name as first_last_name,
    phone_number,
    phone_number_2,
    COALESCE(phone_number, phone_number_2, 'phone number does not exist') as first_number --soldan saga null degerleri kontrol ediyor
    from hr.employees;

---------------------------------------------------------------------
--NULLIF

select first_name, last_name, salary, (salary_new - salary)/NULLIF(salary, 0) as rise   from hr.employees

-----------------
--Example

SELECT
    UPPER(CONCAT(first_name, ' ', last_name)) AS full_name,
    email,
    CASE
        WHEN hire_date < '1997-01-01' THEN 'Senior'
        ELSE 'Junior'
    END AS experience_level,
    CASE
        WHEN salary >= 15000 THEN 'Top Level'
        WHEN salary >= 10000 AND salary < 15000 THEN 'High'
        WHEN salary >= 5000 AND salary < 10000 THEN 'Medium'
        WHEN NULLIF(salary, 0) > 0 AND salary < 5000 THEN 'Entry Level'
        WHEN salary IS NULL OR salary = 0 THEN 'Needs Update'
    END AS salary_level,
    COALESCE(phone_number, email) AS contact_info,
    CASE
        WHEN COALESCE(NULLIF(salary, 0), 0) = 0 THEN 'Needs Update'
        ELSE 'Updated'
    END AS salary_status
FROM
    hr.employees
WHERE
    salary IS NOT NULL
ORDER BY
    salary DESC;