-- ROW_NUMBER
-- Assigns a unique sequential number to each row within a partition.
-- Usage: Can be used especially to find the first or last row in a dataset.

-- ROW_NUMBER() OVER (PARTITION BY column_name ORDER BY column_name)

-- List the orders of each customer in date order.

select
    contactid,
    bookingdate,
    to_char(bookingdate, 'YYYY-MM-DD') as booking_day,
    row_number() over (partition by  contactid order by to_char(bookingdate, 'YYYY-MM-DD')) as row_n
from travels.bookings;

-- RANK
-- The RANK function in SQL ranks the data returned by a query according to a specific sorting order
-- and assigns a rank number to each row. However, unlike the ROW_NUMBER function,
-- the RANK function assigns the same rank number when multiple rows have the same value
-- in the sorting order.
-- RANK() OVER (PARTITION BY column_name ORDER BY column_name)

select
    contactid,
    bookingdate,
    to_char(bookingdate, 'YYYY-MM-DD') as booking_day,
    row_number() over (partition by  contactid order by to_char(bookingdate, 'YYYY-MM-DD')) as row_n,
    rank() over (partition by  contactid order by to_char(bookingdate, 'YYYY-MM-DD')) as rank_n
from travels.bookings


-- DENSE_RANK
-- Similar to the RANK function, it is used to sort rows in query results,
-- but unlike the RANK function, it assigns the same rank number to rows with equal sort values
-- and has the ability to skip no gaps in the ranking sequence.
-- DENSE_RANK() OVER (PARTITION BY column_name ORDER BY column_name)

select
    contactid,
    bookingdate,
    to_char(bookingdate, 'YYYY-MM-DD') as booking_day,
    row_number() over (partition by  contactid order by to_char(bookingdate, 'YYYY-MM-DD')) as row_n,
    rank() over (partition by  contactid order by to_char(bookingdate, 'YYYY-MM-DD')) as rank_n,
    dense_rank() over (partition by  contactid order by to_char(bookingdate, 'YYYY-MM-DD')) as dense_rank_n
from travels.bookings
