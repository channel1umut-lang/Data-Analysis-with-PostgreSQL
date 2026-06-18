--bring higher than 5 employees in departman catecory

select
    department_id,
    count(employee_id) as count_emp
from hr.employees
group by 1
having count(employee_id)>= 5;

--bring salary > 5000 group by demartment_id
select  department_id,
        count(employee_id) as emp_count
        from hr.employees where salary>5000
group by department_id;

------
select
    department_id,
    count(employee_id) as count_emp
from hr.employees
where salary>5000
group by 1
having count(employee_id)>= 5;