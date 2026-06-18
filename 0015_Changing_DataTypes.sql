--Changing Data Type

--CAST
--en fazla rezervasyon yapilan tarih

select
    cast(bookingdate as date),
    bookingdate::date,
    count(*)
from bookings
group by 1
order by 2 desc

select cast('123' as integer), '123';
--avg, sum, min, max

select cast(123 as text);

select cast('Hello, World' as varchar(5));

select cast ('hello' as char);

select cast ('true' as boolean);

select cast ('2024-08-31' as date), '2024-08-31';

select cast ('2024-08-31 15:30:00' as timestamp);

--TO CHAR

select
bookingdate,
bookingdate::date,
to_char(bookingdate, 'YYYY-MM'),
to_char(bookingdate, 'YY-MM'),
to_char(bookingdate, 'YY-MM-DD'),
to_char(bookingdate, 'Day')
    from bookings

