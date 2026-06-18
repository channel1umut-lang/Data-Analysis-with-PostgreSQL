--Aggregate Functions
--count, sum , min , max, acg

--count : number of rows

select count(*) from hr.employees;
--40

select count(phone_number) from hr.employees;
--34
select count(*) from hr.employees
where phone_number is null
--6
--find number of workers, people who  has 9000> salary and its rate
select count(*) as total_emp,
count(case when salary>=9000 then 1 else null end) as high_earners,
sum(case when salary>=9000 then 2 else null end) as high_earners,
count(case when salary>=9000 then 1 else null end)*1.0/count(*) as ratio
from hr.employees

-- finding the number of employee by department category
--yani departman bazinda kac tane ayni eleman sayisini bulma
select
    department_id,
    count(employee_id)
from hr.employees
group by 1--1=first column
order by 1;

--department_id, manager_id number of employees
select
    department_id,
    manager_id,
    count(employee_id) as count_emp
from hr.employees
group by 1,2--hem 1  hem 2 ye gore




