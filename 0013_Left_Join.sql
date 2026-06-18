--LEFT JOIN
--List of customer orders

select company_name, count(order_id) from orders o
left join customers c on c.customer_id = o.customer_id
group by company_name;

select count(*) from orders;
--830 rows

--The total amount of orders placed by customers.
select count(*) from orders
left join order_details on orders.order_id = order_details.order_id;

--2155 rows, A kesisim B kumesinde sadece A yi aldi

select company_name, sum(unit_price*quantity * (1 - discount)) from orders
left join order_details on orders.order_id = order_details.order_id
left join customers on customers.customer_id = orders.customer_id
group by 1;

select * from products;

--FULL OUTER JOIN (orders and employees)
select count(*)
from orders;
--830 rows

select * from employees;
--9 rows

select * from orders --aslinda A birlesim B yi yapti ama tablo kotu oldugu icin goremiyoruz sonucu
full outer join  employees on orders.employee_id = employees.employee_id -- orders in employee_id si ile employees deki employee_id yi full outer join yapti.
where orders.employee_id is null; -- null degeri bulma

--CROSS JOIN

select  * from orders
cross join employees;

select count(*) from orders ;
--830

select count (*) from employees;
--9


select  count(*) from orders
cross join employees;
--7470 = 9 * 830

select * from jobs
where min_salary >