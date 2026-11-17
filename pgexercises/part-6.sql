
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

