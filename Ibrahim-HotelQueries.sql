-- Query 1 result 4 rows
SELECT guest_name,roomId,start_date,end_date
FROM reservation 
INNER JOIN guest USING (guestId)
WHERE end_date BETWEEN '2023-7-1' AND '2023-7-31';


-- Query 2 result 11 rows
SELECT g.guest_name AS guestName,reservation.roomId as Room, reservation.start_date ,reservation.end_date
FROM reservation
INNER JOIN roomamenity AS r USING (roomId)
INNER JOIN amenity AS a USING (amenityId)
INNER JOIN guest AS g USING (guestId)
WHERE amenity_name = 'Jacuzzi';

-- Query 3 result 3 rows
SELECT guest_name,roomId,start_date,(adults + children) as people
FROM reservation
INNER JOIN guest USING (guestId)
WHERE guest.guest_name = 'Bettyann Seery';

-- Query 4 result 27 rows
SELECT roomId, IFNULL(reservationId,'N/A') reservationId, IFNULL(total_cost,'N/A') total_cost
FROM room
LEFT JOIN reservation USING (roomId);

-- extra exercise, total income for each room in the reservation list.
-- result 18 rows
SELECT roomId,group_concat(reservationId separator ',') as reservationId, sum(total_cost)
FROM room
LEFT JOIN reservation USING (roomId)
GROUP BY roomId;

-- Query 5 result 1 row
SELECT *
FROM reservation
INNER JOIN room USING (roomId)
WHERE room.maximum_occupancy >= 3 
	AND (reservation.start_date BETWEEN '2023-4-1' AND '2023-4-30');
    
-- Query 6 result 13 rows
SELECT guest.guest_name, count(reservationId) as total_revervations
FROM reservation
RIGHT JOIN guest USING (guestId)
GROUP BY reservation.guestId
ORDER BY COUNT(reservationId) DESC, 
		substring_index(guest.guest_name,' ',-1) ASC;

-- Extra exercise, get all customers' last name.
-- result 13 rows
SELECT DISTINCT substring_index(guest.guest_name,' ',-1) AS lastName
FROM reservation
RIGHT JOIN guest USING (guestId);

-- Query 7 result 1 row
SELECT guest_name,address,phone
FROM guest
WHERE guest.phone = '4782779632';


