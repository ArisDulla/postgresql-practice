
--- For our first foray into aggregates, we're going to stick to something simple. 
--- We want to know how many facilities exist - simply produce a total count.
/*
SELECT COUNT(*) as count
FROM cd.facilities as f


select facid, 
	(select count(*) from cd.facilities)
	from cd.facilities

*/

--- Produce a count of the number of facilities that have a cost to guests of 10 or more.
/*
SELECT COUNT(*)
FROM cd.facilities
WHERE guestcost >= 10;

*/

--- Produce a count of the number of recommendations each member has made. Order by member ID.

/*
SELECT recommendedby,count(*)
FROM cd.members
WHERE recommendedby is not NULL
GROUP BY recommendedby
ORDER BY recommendedby


*/
--- When SQL encounters a GROUP BY clause, it calculates aggregate functions 
--- (such as COUNT, SUM, AVG, MAX, and MIN) separately for each group.

--- HAVING → Filters groups based on aggregate functions. HAVING COUNT(*) > 2;
--- OVER() → Calculates results while preserving the original rows.

----------------------
--- Produce a list of the total number of slots booked per facility. 
--- For now, just produce an output table consisting of facility id and slots, sorted by facility id.

/*
SELECT facid, SUM(slots) as "Total Slots"
FROM cd.bookings
GROUP BY facid
ORDER BY facid
*/

--- Produce a list of the total number of slots booked per facility in the month of September 2012. 
--- Produce an output table consisting of facility id and slots, sorted by the number of slots.

/*
SELECT facid, SUM(slots) as "Total Slots" 
FROM cd.bookings
WHERE starttime >= '2012-9-1' and starttime < '2012-10-1'
GROUP BY facid
ORDER BY "Total Slots"  
*/ 
--- or order by sum(slots);  

--- Produce a list of the total number of slots booked per facility per month in the year of 2012. 
--- Produce an output table consisting of facility id and slots, sorted by the id and month.
/*
SELECT facid, EXTRACT(MONTH FROM starttime)as month ,SUM(slots) as "Total Slots"
FROM cd.bookings 
WHERE starttime >= '2012-1-1' and starttime < '2013-1-1'
GROUP BY facid,month
ORDER BY facid,month

*/
--- OR  where extract(year from starttime) = 2012