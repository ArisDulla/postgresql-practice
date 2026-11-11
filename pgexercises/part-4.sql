
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

--- How can you output a list of all members, including the individual who recommended them (if any)? 
--- Ensure that results are ordered by (surname, firstname).

/*
SELECT  a.firstname as memfname , 
        a.surname as memsname ,
        b.firstname as recfname , 
	b.surname as recsname 
FROM cd.members as a
LEFT OUTER JOIN cd.members as b
             ON b.memid = a.recommendedby
ORDER BY a.surname , a.firstname;
*/

--- How can you produce a list of all members who have used a tennis court? 
--- Include in your output the name of the court, and the name of the member formatted as a single column. 
--- Ensure no duplicate data, and order by the member name followed by the facility name.

/*

SELECT DISTINCT a.firstname || ' ' || a.surname as member,
       c.name as facility
FROM cd.members as a
INNER JOIN cd.bookings as b
        ON a.memid = b.memid		
INNER JOIN cd.facilities as c
        ON b.facid = c.facid
WHERE 
      c.name in ('Tennis Court 2','Tennis Court 1')
ORDER BY member, facility;

*/