--group workers by their salary
-- <8000 and >=8000

--CASE WHEN EXPRESSION
select
    first_name, last_name, salary,
    case
        when salary<8000 then 'low salary'
        when salary >= 8000 and salary < 1000 then 'higher salary'
        --when salary> 1000 then 'admin!'
        else 'admin!'
    end as salary_segment
from hr.employees

--Example

SELECT
    CONCAT(first_name, ' ', last_name) AS full_name,
    email AS old_email,
    LOWER(CONCAT(
            REPLACE(last_name, ' ', ''),
            '.',
        REPLACE(first_name, ' ', ''),
        '@udemy.com'
    )) AS new_email
FROM
    hr.employees;
