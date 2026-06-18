--STRING FUNCTIONS
--CONCAT

select first_name,
   last_name, concat ( first_name,' ', last_name) --= first_name || ' ' || last_name
    from
       hr.employees
--
select *, concat(first_name,'_',email,'_',phone_number) as unique_ad from hr.employees;
--LEFT

select phone_number, left(phone_number, 3) from hr.employees;

--RIGHT

select email, right(email,17) from hr.employees;

--LENGTH

select first_name, length(first_name) from hr.employees;

--LOWER UPPER

select first_name, lower(first_name), upper(first_name) from hr.employees;

--REPLACE

select email, replace(email,'veriegitimi.com', 'abc.com')
from hr.employees;

--SPLIT_PART

select email, split_part(email,'@',2), split_part(email,'@',1)
from hr.employees;