

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
      
--- Question
--- The club is adding a new facility - a spa. We need to add it into the facilities table. Use the following values:
--- facid: 9, Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.
/*
INSERT INTO cd.facilities (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
VALUES (9, 'Spa', 20, 30,100000,800);
*/

--- In the previous exercise, you learned how to add a facility. Now you're going to add multiple facilities in one command. Use the following values:
--- facid: 9, Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.
--- facid: 10, Name: 'Squash Court 2', membercost: 3.5, guestcost: 17.5, initialoutlay: 5000, monthlymaintenance: 80.
/*
INSERT INTO cd.facilities (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
VALUES (9, 'Spa', 20, 30,100000,800),
       (10, 'Squash Court 2', 3.5, 17.5,5000,80);
*/


--- Let's try adding the spa to the facilities table again. This time, though, 
--- we want to automatically generate the value for the next facid, rather than specifying 
--- it as a constant. Use the following values for everything else:

--- Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.

/*
INSERT INTO cd.facilities (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
SELECT (SELECT max(facid) from cd.facilities)+1,'Spa', 20, 30,100000,800;
*/