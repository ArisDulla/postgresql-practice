
--- How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? 
--- Return a list of start time and facility name pairings, ordered by the time.

/*
SELECT starttime start, name
FROM cd.facilities f
INNER JOIN cd.bookings b
        ON f.facid = b.facid
WHERE 
      f.name LIKE 'Tennis%' AND
      b.starttime >= '2012-09-21' AND
      b.starttime < '2012-09-22' 
ORDER BY b.starttime;
*/

--- OR  facs.name in ('Tennis Court 2','Tennis Court 1') and


--- How can you output a list of all members who have recommended another member? 
--- Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).

/*
SELECT DISTINCT b.firstname , b.surname  
FROM cd.members a
INNER JOIN cd.members b
        ON b.memid = a.recommendedby
ORDER BY surname,firstname;
*/