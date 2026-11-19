
--- Produce a list of facilities with more than 1000 slots booked. 
--- Produce an output table consisting of facility id and slots, sorted by facility id.

/*

SELECT facid, SUM(slots) as "Total Slots"
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid



*/


--- Produce a list of facilities along with their total revenue. 
--- The output table should consist of facility name and revenue, sorted by revenue. 
--- Remember that there's a different cost for guests and members!

/*

SELECT f.name, sum(b.slots * CASE 
                                  WHEN b.memid = 0 THEN f.guestcost
                                  ELSE  f.membercost
                             END) AS revenue 
FROM cd.bookings as b
INNER JOIN cd.facilities as f
        ON f.facid = b.facid
GROUP BY f.name
ORDER BY revenue


*/