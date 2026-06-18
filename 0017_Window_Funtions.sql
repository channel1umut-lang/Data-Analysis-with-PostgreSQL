-- WINDOW FUNCTIONS

-- SQL window functions are a special type of function used to group, order, analyze, and summarize data within a dataset.

--<window function> ( [expression] ) OVER (
--   [PARTITION BY partition_expression, ... ]
--   [ORDER BY sort_expression [ASC|DESC], ... ]
--   [ROWS frame_specification]
--)


-- WINDOW FUNCTIONS WITH AGGREGATE
-- AVG(column_name) OVER (PARTITION BY column_name)

-- For each employee's information, show the average salary information of the relevant department.

select * from hr.employees;

with avg_salary as (select department_id,
                           avg(salary) as d_avg_salary
                    from hr.employees
                    group by 1
)

select
    first_name,
    e.department_id,
    e.salary,
    d_avg_salary
    from hr.employees as e
left join avg_salary as a_s on e.department_id = a_s.department_id;

--With Windows function

select
    first_name,
    e.department_id,
    d.department_id,
    salary,
    avg(salary) over() as avg_salary,
    avg(salary) over (partition by e.department_id) as d_avg_salary,
    sum(salary) over (partition by e.department_id) as d_sum_salary
    from hr.employees e
left join hr.departments d on e.department_id = d. department_id