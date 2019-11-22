#Guest House Assessment Easy


# 1) Guest 1183. Give the booking_date and the number of nights for guest 1183.
SELECT first_name,
       last_name
FROM booking JOIN
     guest
     ON guest_id = guest.id
WHERE room_no=101 AND booking_date='2016-11-17'

# 2.When do they get here? List the arrival time and the first and last names for all guests due to arrive on 2016-11-05, order the output by time of arrival.\

select b.arrival_time,
       g.first_name,
       g.last_name
from booking b,
     guest g
where b.guest_id = g.id 
and booking_date = '2016-11-05'
order by arrival_time;


#4.Who’s in 101? Find who is staying in room 101 on 2016-12-03, include first name, last name and address.
select g.first_name, 
           g.last_name,
           g.address
from guest g, booking b
where g.id = b.guest_id
and b.room_no = 101 
and b.booking_date = '2016-12-03';


# 5. How many bookings, how many nights? 
# For guests 1185 and 1270 show the number of bookings made and the total number of nights. Your output should include the guest id and the total number of bookings and the total number of nights.
select guest_id,
          count( guest_id),
          sum(nights)
from booking
where guest_id in (1185, 1270)
group by 1;


