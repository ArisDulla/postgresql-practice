
--- For our first foray into aggregates, we're going to stick to something simple. 
--- We want to know how many facilities exist - simply produce a total count.
/*
SELECT COUNT(*) as count
FROM cd.facilities as f


select facid, 
	(select count(*) from cd.facilities)
	from cd.facilities

*/