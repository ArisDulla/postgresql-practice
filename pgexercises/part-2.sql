

--- How can you produce a list of facilities, with each labelled as 'cheap' or 'expensive' depending on 
--- if their monthly maintenance cost is more than $100? 
--- Return the name and monthly maintenance of the facilities in question.

/*
SELECT name, monthlymaintenance,
CASE 
 WHEN monthlymaintenance >= 100 THEN 'expensive'
 WHEN monthlymaintenance < 100 THEN 'cheap'
 ELSE 'okay'
END AS cost
FROM cd.facilities;
*/

--- OR case when (monthlymaintenance > 100) then
---              '  '


--- How can you produce a list of members who joined after the start of September 2012? 
--- Return the memid, surname, firstname, and joindate of the members in question.

/*
SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE joindate >= '2012-9-1';
*/

--- How can you produce an ordered list of the first 10 surnames in the members table? 
--- The list must not contain duplicates.

/*
SELECT DISTINCT surname
FROM cd.members
ORDER BY surname
LIMIT 10;
*/

--- You, for some reason, want a combined list of all surnames and all facility names. 
--- Yes, this is a contrived example :-). Produce that list!

/*
SELECT surname 
FROM cd.members
UNION
SELECT name
FROM cd.facilities
*/
