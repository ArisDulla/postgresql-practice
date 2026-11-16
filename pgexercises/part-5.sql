

--- How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30? 
--- Remember that guests have different costs to members (the listed costs are per half-hour 'slot'), and the guest user is always ID 0. 
--- Include in your output the name of the facility, the name of the member formatted as a single column, and the cost. 
--- Order by descending cost.

/*
SELECT bookings.member, bookings.facility, bookings.cost 
FROM ( 
      SELECT m.firstname || ' ' || m.surname as member,
             f.name as facility,
      CASE 
          WHEN m.memid = 0 THEN b.slots * f.guestcost
          ELSE b.slots * f.membercost
      END as cost
      FROM cd.members as m
           INNER JOIN cd.bookings as b
                   ON b.memid = m.memid
           INNER JOIN cd.facilities as f
                   ON f.facid = b.facid
      WHERE
           b.starttime >= '2012-09-14' AND 
           b.starttime < '2012-09-15'
      )as bookings 
WHERE cost > 30
ORDER BY cost desc;	  
*/
      