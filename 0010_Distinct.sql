--DISTINCT (unique)

--unique manager_id
select
    count(distinct(manager_id)),
    count(manager_id),
    count(*)
from hr.employees;

---
select
    distinct manager_id
from hr.employees;

---

select
    manager_id,
    count(*)
from hr.employees
group by 1;