--Bring the costumers' last order and the shipping freight paid for that order
select
    customer_id,
    max(order_id) as last_order
from northwind.orders
group by 1