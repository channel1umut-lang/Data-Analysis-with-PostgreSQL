--Date/Time Functions

select current_date;

select current_time;

select current_timestamp;

select now();

--date_trunc
select
    bookingdate,
    date_trunc('month', bookingdate),
    date_trunc('day', bookingdate),
    date_trunc('year', bookingdate),
    date_trunc('year', bookingdate):: date
    from bookings;

--extract

select extract(year from '2024-06-01 12:30:15':: TIMESTAMP);
select extract(day from '2024-06-05 12:30:15':: TIMESTAMP);

select
    bookingdate,
    extract(month from bookingdate)
    from bookings;

--Musterinin son siparisi uzerinden kac gun gecmis.

select  age('2022-06-03 11:30:15'::TIMESTAMP, '2022-06-01 12:40:15'::TIMESTAMP);--interval

select  '2022-06-03 11:30:15'::TIMESTAMP - '2022-06-01 12:40:15'::TIMESTAMP;

select extract (day from '2022-06-10 11:30:15'::TIMESTAMP - '2022-06-01 12:40:15'::TIMESTAMP);

select
    bookingdate,
    current_date,
    current_date - bookingdate,
    age(current_date, bookingdate),
    extract(day from current_date - bookingdate)
from bookings;

--date_part
select date_part('month','2022-06-01 12:30:20'::TIMESTAMP);
select extract(month from '2022-06-01 12:30:20'::TIMESTAMP);

--intervar
select ('2022-06-01'::DATE - interval '1 month')::DATE, '2022-06-01'::DATE;--::DATE yanindaki saati vs silio

--2021-06-02: today
select --su tarihte bir hafta geri git ordan itibaren degerleri getir demek
    id as booking_id,
    bookingdate,
    contactid
from bookings
where bookingdate >= '2021-06-01 00:00:00'::TIMESTAMP - interval '1 week';

select
    to_char(bookingdate, 'YYYY-MM') as booking_month,
    count(*)
from bookings
--where bookingdate >= '2021-06-01 00:00:00'::TIMESTAMP - interval '1 week';
group by 1