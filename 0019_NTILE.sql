--NTILE()

-- The NTILE() function is a SQL window function used to divide a dataset into an equal number of buckets
-- and determine the position of each part within the ordering.
-- NTILE(n) OVER (ORDER BY <order_column>)

-- If we say today is 2021-05-27 and segment each customer, we want to do a marketing activity for that.


with t1 as (
    select
        id,
        contactid,
        bookingdate::DATE as date_1,
        row_number() over (partition by contactid order by bookingdate DESC) as r_index
    from travels.bookings
)

select
    contactid,
    date_1,
    '2021-05-27'::DATE - date_1 as days_since_last_booking,
    ntile(4) over(order by '2021-05-27'::DATE - date_1 ) as group_no
from t1
where r_index = 1
order by 3 desc

