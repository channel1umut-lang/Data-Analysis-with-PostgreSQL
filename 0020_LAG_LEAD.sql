-- LAG
-- LAG is used in SQL to get the value from the previous row.
-- LAG(column_name, <offset>, <default_value>) OVER ( PARTITION BY <partition_column> ORDER BY <order_column>)
-- LAG(bookingdate, 1 , NULL) OVER (PARTITION BY contactid ORDER BY bookingdate ) as prev_bookingdate

-- Get the booking date one day before a customer's last booking date.

select
    id,
    contactid,
    bookingdate,
    lag(bookingdate) over (partition by contactid order by bookingdate) as prev_book_date
from travels.bookings
order by 2,3

--LEAD

select
    id,
    contactid,
    bookingdate,
    lag(bookingdate) over (partition by contactid order by bookingdate) as prev_book_date,
    lead(bookingdate) over (partition by contactid order by bookingdate) as next_book_date,
    lead(bookingdate, 2) over (partition by contactid order by bookingdate) as next_2_book_date
from travels.bookings
order by 2,3
