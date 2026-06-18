--INNER JOIN
--which item is ordered by costumer? order_id, costumer name , order date

select order_id, company_name , orders.customer_id, order_date from northwind.orders
inner join customers on orders.customer_id = customers.customer_id;

--Bring the name of each product and its category name.

select
    p.product_name,
    c.category_name
from products as p
inner join categories c on p.category_id = c.category_id limit 100;

