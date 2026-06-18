--Subquery()
--CTE(Common Table Expressions)

--Get the names of categories that have more than 10 products.

select coalesce(category_name, 'NoCategoryName'),
       count(product_id) as product_count
from products p
left join  categories c on c.category_id = p.category_id
group by 1
having count(product_id) <=10;

--Subquery
select * from ( -- ic ice fonksiyon gibi
select coalesce(category_name, 'NoCategoryName'),
       count(product_id) as product_count
from products p
left join  categories c on c.category_id = p.category_id
group by 1) as t
where product_count <=10;

--CTE
with product_count as ( -- like describin variable
    select coalesce(category_name, 'NoCategoryName'),
       count(product_id) as product_count
from products p
left join  categories c on c.category_id = p.category_id
group by 1
)
select  *  from product_count
where product_count <= 10 ; -- same result

--CTE v2

with product_count as (
    select category_id, count(product_id) as product_count
from products p
where category_id is not null
group by 1
),

category_list as (
        select category_id, category_name from categories
    ),

final as (
select category_name, product_count from product_count pc
left join category_list cl on pc.category_id = cl. category_id
where product_count <= 10)

select * from final;
