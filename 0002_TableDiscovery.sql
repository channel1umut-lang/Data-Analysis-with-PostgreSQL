SELECT * FROM countries limit 10;

-- primary and secondary key =
-- region_id is a foreign key here (references the primary key of another table)
-- country_id is the primary key of this table, meaning it contains unique values.
-- Yellow indicates primary key, blue indicates foreign key.

select * from regions limit 10;

select * from departments limit 10;

select * from locations limit 10;

select * from employees limit 10;

select * from jobs limit 10;

--bring salary = 6000

select first_name, last_name from hr.employees where salary = 6000;

select first_name, last_name, salary from hr.employees where salary >=6000;

--bring who does not have phone number

select * from hr.employees where phone_number is null;

--bring who have phone number

select * from hr.employees where phone_number is not null-- works if only is True value
or salary>=10000;
--using or and and
select * from hr.employees where department_id=3 or department_id = 5;
--using in (same result with up)
select * from hr.employees where department_id in (3,5);

--bring 1996-1998
select * from hr.employees where hire_date between '1996-01-01' and '1998-01-01';

--bring name start with j
select *from hr.employees where first_name like 'Jo%n' --% is mean that after J does not matter
