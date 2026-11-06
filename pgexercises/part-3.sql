
--- You'd like to get the signup date of your last member. How can you retrieve this information?

/*
SELECT MAX(joindate) AS latest
FROM cd.members;
*/

--- You'd like to get the first and last name of the last member(s) who signed up - not just the date. 
--- How can you do that?

/*
SELECT firstname, surname, joindate FROM cd.members
WHERE joindate = (SELECT MAX(joindate) FROM cd.members)
*/
--- order by joindate desc  + LIMIT 1



--- How can you produce a list of the start times for bookings by members named 'David Farrell'?

/*
SELECT starttime
FROM cd.bookings AS b
INNER JOIN cd.members AS m
ON b.memid = m.memid
AND ((m.firstname = 'David' ) AND (m.surname = 'Farrell')) 
*/

--- OR 

--- Implicit JOIN.
/*
select bks.starttime
        from
                cd.bookings bks,
                cd.members mems
        where
                mems.firstname='David'
                and mems.surname='Farrell'
                and mems.memid = bks.memid;
*/

--- OR

/*
select bks.starttime 
	from 
		cd.bookings bks
		inner join cd.members mems
			on mems.memid = bks.memid
	where 
		mems.firstname='David' 
		and mems.surname='Farrell';     
*/

