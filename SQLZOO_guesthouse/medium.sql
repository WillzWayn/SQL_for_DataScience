#6.Ruth Cadbury. Show the total amount payable by guest Ruth Cadbury for her room bookings. You should JOIN to the rate table using room_type_requested and occupants.

select sum(nights*amount)
from booking b, rate r
where b.room_type_requested = r.room_type 
and b.occupants = r.occupancy
and b.guest_id = (select id
                  from guest
                  where first_name = 'Ruth' and last_name = 'Cadbury')


