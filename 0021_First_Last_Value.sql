-- FIRST_VALUE
-- The "FIRST_VALUE" function returns the first value in a column.
-- FIRST_VALUE(column_name) OVER (PARTITION BY column_name ORDER BY column_name)

select
    id,
    contactid,
    bookingdate,
    first_value(bookingdate) over (partition by contactid order by bookingdate) as first_bookingDate,
    first_value(bookingdate) over (partition by contactid order by bookingdate desc) as last_bookingDate
from travels.bookings
order by 2,3

